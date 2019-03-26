library(AMR)


### Name: as.atc
### Title: Transform to ATC code
### Aliases: as.atc atc guess_atc is.atc
### Keywords: atc

### ** Examples

# These examples all return "J01FA01", the ATC code of Erythromycin:
as.atc("J01FA01")
as.atc("Erythromycin")
as.atc("eryt")
as.atc("ERYT")
as.atc("ERY")
as.atc("Erythrocin") # Trade name
as.atc("Eryzole")    # Trade name
as.atc("Pediamycin") # Trade name

# Use ab_* functions to get a specific property based on an ATC code
Cipro <- as.atc("cipro") # returns `J01MA02`
ab_official(Cipro)       # returns "Ciprofloxacin"
ab_umcg(Cipro)           # returns "CIPR", the code used in the UMCG



