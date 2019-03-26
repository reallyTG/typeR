library(D3GB)


### Name: genomebrowser
### Title: Generates an interactive genome browser.
### Aliases: genomebrowser

### ** Examples

# Genome browser generation.
# It creates a genome browser ready to be viewed in Firefox.
# For a server version, ready to be shared with Apache as a Website, set the parameter server=True
gb <- genomebrowser(GRCh38.bands, dir="GRCh38_browser")
# Now you can add sequences, tracks, gff or vcf



