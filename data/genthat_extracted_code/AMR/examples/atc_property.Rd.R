library(AMR)


### Name: atc_property
### Title: Properties of an ATC code
### Aliases: atc_property atc_groups atc_ddd

### ** Examples

## No test: 
# What's the ATC of amoxicillin?
guess_atc("Amoxicillin")
# [1] "J01CA04"

# oral DDD (Defined Daily Dose) of amoxicillin
atc_property("J01CA04", "DDD", "O")
# parenteral DDD (Defined Daily Dose) of amoxicillin
atc_property("J01CA04", "DDD", "P")

atc_property("J01CA04", property = "groups") # search hierarchical groups of amoxicillin
# [1] "ANTIINFECTIVES FOR SYSTEMIC USE"
# [2] "ANTIBACTERIALS FOR SYSTEMIC USE"
# [3] "BETA-LACTAM ANTIBACTERIALS, PENICILLINS"
# [4] "Penicillins with extended spectrum"
## End(No test)



