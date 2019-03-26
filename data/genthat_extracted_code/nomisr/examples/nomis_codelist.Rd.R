library(nomisr)


### Name: nomis_codelist
### Title: Nomis codelists
### Aliases: nomis_codelist

### ** Examples

## No test: 
x <- nomis_codelist("NM_1_1", "item")


# Searching for codes ending with "london"
y <- nomis_codelist("NM_1_1", "geography", search = "*london")


z <- nomis_codelist("NM_161_1", "cause_of_death")
## End(No test)



