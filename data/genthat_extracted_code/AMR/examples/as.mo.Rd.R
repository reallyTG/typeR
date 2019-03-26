library(AMR)


### Name: as.mo
### Title: Transform to microorganism ID
### Aliases: as.mo mo is.mo guess_mo
### Keywords: Becker Lancefield becker guess lancefield mo

### ** Examples

# These examples all return "B_STPHY_AUR", the ID of S. aureus:
as.mo("stau")
as.mo("STAU")
as.mo("staaur")
as.mo("S. aureus")
as.mo("S aureus")
as.mo("Staphylococcus aureus")
as.mo("MRSA") # Methicillin Resistant S. aureus
as.mo("VISA") # Vancomycin Intermediate S. aureus
as.mo("VRSA") # Vancomycin Resistant S. aureus
as.mo(369)    # Search on TSN (Taxonomic Serial Number), a unique identifier
              # for the Integrated Taxonomic Information System (ITIS)

as.mo("Streptococcus group A")
as.mo("GAS") # Group A Streptococci
as.mo("GBS") # Group B Streptococci

# guess_mo is an alias of as.mo and works the same
guess_mo("S. epidermidis")                 # will remain species: B_STPHY_EPI
guess_mo("S. epidermidis", Becker = TRUE)  # will not remain species: B_STPHY_CNS

guess_mo("S. pyogenes")                    # will remain species: B_STRPTC_PYO
guess_mo("S. pyogenes", Lancefield = TRUE) # will not remain species: B_STRPTC_GRA

# Use mo_* functions to get a specific property based on `mo`
Ecoli <- as.mo("E. coli")     # returns `B_ESCHR_COL`
mo_genus(Ecoli)               # returns "Escherichia"
mo_gramstain(Ecoli)           # returns "Gram negative"
# but it uses as.mo internally too, so you could also just use:
mo_genus("E. coli")           # returns "Escherichia"


## Not run: 
##D df$mo <- as.mo(df$microorganism_name)
##D 
##D # the select function of tidyverse is also supported:
##D library(dplyr)
##D df$mo <- df %>%
##D   select(microorganism_name) %>%
##D   guess_mo()
##D 
##D # and can even contain 2 columns, which is convenient for genus/species combinations:
##D df$mo <- df %>%
##D   select(genus, species) %>%
##D   guess_mo()
##D 
##D # same result:
##D df <- df %>%
##D   mutate(mo = guess_mo(paste(genus, species)))
## End(Not run)



