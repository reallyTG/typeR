library(AMR)


### Name: mo_property
### Title: Property of a microorganism
### Aliases: mo_property mo_fullname mo_shortname mo_subspecies mo_species
###   mo_genus mo_family mo_order mo_class mo_phylum mo_subkingdom mo_ref
###   mo_type mo_TSN mo_gramstain mo_taxonomy

### ** Examples

# All properties of Escherichia coli
mo_subkingdom("E. coli")      # "Negibacteria"
mo_phylum("E. coli")          # "Proteobacteria"
mo_class("E. coli")           # "Gammaproteobacteria"
mo_order("E. coli")           # "Enterobacteriales"
mo_family("E. coli")          # "Enterobacteriaceae"
mo_genus("E. coli")           # "Escherichia"
mo_species("E. coli")         # "coli"
mo_subspecies("E. coli")      # NA
mo_fullname("E. coli")        # "Escherichia coli"
mo_shortname("E. coli")       # "E. coli"
mo_gramstain("E. coli")       # "Gram negative"
mo_TSN("E. coli")             # 285
mo_type("E. coli")            # "Bacteria"
mo_ref("E. coli")             # "Castellani and Chalmers, 1919"


# Abbreviations known in the field
mo_genus("MRSA")              # "Staphylococcus"
mo_species("MRSA")            # "aureus"
mo_shortname("MRSA")          # "S. aureus"
mo_gramstain("MRSA")          # "Gram positive"

mo_genus("VISA")              # "Staphylococcus"
mo_species("VISA")            # "aureus"


# Known subspecies
mo_genus("doylei")            # "Campylobacter"
mo_species("doylei")          # "jejuni"
mo_fullname("doylei")         # "Campylobacter jejuni doylei"

mo_fullname("K. pneu rh")     # "Klebsiella pneumoniae rhinoscleromatis"
mo_shortname("K. pneu rh")    # "K. pneumoniae"


# Becker classification, see ?as.mo
mo_fullname("S. epi")                     # "Staphylococcus epidermidis"
mo_fullname("S. epi", Becker = TRUE)      # "Coagulase Negative Staphylococcus (CoNS)"
mo_shortname("S. epi")                    # "S. epidermidis"
mo_shortname("S. epi", Becker = TRUE)     # "CoNS"

# Lancefield classification, see ?as.mo
mo_fullname("S. pyo")                     # "Streptococcus pyogenes"
mo_fullname("S. pyo", Lancefield = TRUE)  # "Streptococcus group A"
mo_shortname("S. pyo")                    # "S. pyogenes"
mo_shortname("S. pyo", Lancefield = TRUE) # "GAS"


# Language support for German, Dutch, Spanish and Portuguese
mo_type("E. coli", language = "de")       # "Bakterium"
mo_type("E. coli", language = "nl")       # "Bacterie"
mo_type("E. coli", language = "es")       # "Bakteria"
mo_gramstain("E. coli", language = "de")  # "Gramnegativ"
mo_gramstain("E. coli", language = "nl")  # "Gram-negatief"
mo_gramstain("E. coli", language = "es")  # "Gram negativo"

mo_fullname("S. pyogenes",
            Lancefield = TRUE,
            language = "de")              # "Streptococcus Gruppe A"
mo_fullname("S. pyogenes",
            Lancefield = TRUE,
            language = "nl")              # "Streptococcus groep A"


# Complete taxonomy up to Subkingdom, returns a list
mo_taxonomy("E. coli")



