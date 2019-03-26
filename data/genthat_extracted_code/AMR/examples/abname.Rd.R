library(AMR)


### Name: abname
### Title: Name of an antibiotic
### Aliases: abname
### Keywords: ab antibiotics

### ** Examples

abname("AMCL")
# "Amoxicillin and beta-lactamase inhibitor"

# It is quite flexible at default (having `from = "guess"`)
abname(c("amox", "J01CA04", "Trimox", "dispermox", "Amoxil"))
# "Amoxicillin" "Amoxicillin" "Amoxicillin" "Amoxicillin" "Amoxicillin"

# Multiple antibiotics can be combined with "+".
# The second antibiotic will be set to lower case when `tolower` was not set:
abname("AMCL+GENT", textbetween = "/")
# "amoxicillin and enzyme inhibitor/gentamicin"

abname(c("AMCL", "GENT"))
# "Amoxicillin and beta-lactamase inhibitor" "Gentamicin"

abname("AMCL", to = "trivial_nl")
# "Amoxicilline/clavulaanzuur"

abname("AMCL", to = "atc")
# "J01CR02"

# specific codes for University Medical Center Groningen (UMCG):
abname("J01CR02", from = "atc", to = "umcg")
# "AMCL"

# specific codes for Certe:
abname("J01CR02", from = "atc", to = "certe")
# "amcl"



