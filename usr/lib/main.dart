import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const EverystoneApp());
}

class EverystoneApp extends StatelessWidget {
  const EverystoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everystone | Certified Gemstone Infrastructure',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE0E0E0),
          onPrimary: Color(0xFF121212),
          secondary: Color(0xFF9E9E9E),
          surface: Color(0xFF121212),
          onSurface: Color(0xFFFAFAFA),
          error: Color(0xFFCF6679),
        ),
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
          displayMedium: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          headlineLarge: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: GoogleFonts.inter(
            color: const Color(0xFFB3B3B3),
            fontSize: 18,
            height: 1.6,
          ),
          bodyMedium: GoogleFonts.inter(
            color: const Color(0xFFB3B3B3),
            fontSize: 16,
            height: 1.5,
          ),
          labelLarge: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: TopNavigation(),
          ),
          const SliverToBoxAdapter(
            child: HeroSection(),
          ),
          const SliverToBoxAdapter(
            child: ValuePropSection(),
          ),
          const SliverToBoxAdapter(
            child: InfrastructureSection(),
          ),
          SliverToBoxAdapter(
            child: LeadGenerationSection(),
          ),
          const SliverToBoxAdapter(
            child: FooterSection(),
          ),
        ],
      ),
    );
  }
}

class TopNavigation extends StatelessWidget {
  const TopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.diamond_outlined, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Text(
                'EVER\u200aY\u200aS\u200aT\u200aO\u200aN\u200aE',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          // Hide navigation links on smaller screens
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                _NavLink(text: 'Infrastructure'),
                const SizedBox(width: 32),
                _NavLink(text: 'Custody'),
                const SizedBox(width: 32),
                _NavLink(text: 'For Partners'),
                const SizedBox(width: 48),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white24),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text('Request Access'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String text;
  
  const _NavLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.white70,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 64 : 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white10),
            ),
            child: Text(
              'INSTITUTIONAL GRADE INFRASTRUCTURE',
              style: GoogleFonts.inter(
                color: const Color(0xFFAAAAAA),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Deposit once.\nTrade many times.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: isMobile ? 48 : 88,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              'The trusted infrastructure layer for certified gemstones. Transform physical stones into digitally transferable assets without moving them from the vault.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 18 : 22,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 48),
          if (isMobile)
             Column(
               children: [
                  _PrimaryCTA(),
                  const SizedBox(height: 16),
                  _SecondaryCTA(),
               ]
             )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _PrimaryCTA(),
                const SizedBox(width: 16),
                _SecondaryCTA(),
              ],
            ),
        ],
      ),
    );
  }
}

class _PrimaryCTA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 0,
      ),
      child: Text(
        'Join the Network',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _SecondaryCTA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white24),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        'Read the Protocol',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}

class ValuePropSection extends StatelessWidget {
  const ValuePropSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    return Container(
      color: const Color(0xFF111111),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 64 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frictionless Liquidity',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: isMobile ? 32 : 48,
                ),
              ),
              const SizedBox(height: 64),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 800) {
                    return Column(
                      children: const [
                        _ValuePropCard(
                          icon: Icons.security,
                          title: 'Verified Custody',
                          description: 'Stones are audited, certified, and held in insured, world-class vaults.',
                        ),
                        SizedBox(height: 32),
                        _ValuePropCard(
                          icon: Icons.sync_alt,
                          title: 'Digital Transfer',
                          description: 'Ownership transfers securely and instantly on our immutable ledger.',
                        ),
                        SizedBox(height: 32),
                        _ValuePropCard(
                          icon: Icons.insights,
                          title: 'Asset Integrity',
                          description: 'Provenance and certification data are permanently bound to the asset.',
                        ),
                      ],
                    );
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: _ValuePropCard(
                          icon: Icons.security,
                          title: 'Verified Custody',
                          description: 'Stones are audited, certified, and held in insured, world-class vaults.',
                        ),
                      ),
                      SizedBox(width: 48),
                      Expanded(
                        child: _ValuePropCard(
                          icon: Icons.sync_alt,
                          title: 'Digital Transfer',
                          description: 'Ownership transfers securely and instantly on our immutable ledger.',
                        ),
                      ),
                      SizedBox(width: 48),
                      Expanded(
                        child: _ValuePropCard(
                          icon: Icons.insights,
                          title: 'Asset Integrity',
                          description: 'Provenance and certification data are permanently bound to the asset.',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ValuePropCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ValuePropCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white, size: 32),
        const SizedBox(height: 24),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class InfrastructureSection extends StatelessWidget {
  const InfrastructureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 64 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Foundation for Gemstone Capital Markets',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: isMobile ? 32 : 48,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Everystone eliminates the high friction, risk, and cost of moving physical diamonds and gemstones. By holding inventory in our certified network, participants unlock deep liquidity and entirely new financial products.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 32),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward, color: Colors.white),
                      label: Text(
                        'Explore the technology',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ],
                ),
              ),
              if (isMobile) const SizedBox(height: 64) else const SizedBox(width: 80),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.account_tree_outlined,
                      color: Colors.white.withOpacity(0.1),
                      size: 120,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeadGenerationSection extends StatefulWidget {
  const LeadGenerationSection({super.key});

  @override
  State<LeadGenerationSection> createState() => _LeadGenerationSectionState();
}

class _LeadGenerationSectionState extends State<LeadGenerationSection> {
  String? _selectedSegment;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  final List<String> _segments = [
    'Diamond Dealer / Trader',
    'Jewelry Brand / Manufacturer',
    'Private Gemstone Owner / Seller',
    'Investor / Alternative Asset Buyer',
    'Vault, Lab, or Custodian Partner',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: const Color(0xFF111111),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: isMobile ? 64 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Text(
                'Partner with Everystone',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: isMobile ? 28 : 40,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Request early access to the custody and settlement network.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 48),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTextField('Full Name', _nameController),
          const SizedBox(height: 24),
          _buildTextField('Work Email', _emailController),
          const SizedBox(height: 24),
          Text(
            'I am a...',
            style: GoogleFonts.inter(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF0D0D0D),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white24),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedSegment,
                hint: Text('Select an option', style: TextStyle(color: Colors.white30)),
                dropdownColor: const Color(0xFF1A1A1A),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white70),
                isExpanded: true,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSegment = newValue;
                  });
                },
                items: _segments.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Thank you. We will be in touch shortly.')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'Request Access',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF0D0D0D),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.white24),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.white),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white10),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.diamond_outlined, color: Colors.white54, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'EVER\u200aY\u200aS\u200aT\u200aO\u200aN\u200aE',
                    style: GoogleFonts.inter(
                      color: Colors.white54,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              Text(
                '© 2026 Everystone. All rights reserved.',
                style: GoogleFonts.inter(
                  color: Colors.white30,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
