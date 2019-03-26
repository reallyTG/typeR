library(cregg)


### Name: amce
### Title: Tidy estimation of AMCEs
### Aliases: amce amce_by_reference

### ** Examples

data("taxes")
# estimating AMCEs
amce(taxes, chose_plan ~ taxrate1 + taxrate2 + taxrate3 + 
     taxrate4 + taxrate5 + taxrate6 + taxrev, id = ~ ID)

## No test: 
data("immigration")
# estimating AMCEs with constraints
amce(immigration, ChosenImmigrant ~ Gender + ReasonForApplication * CountryOfOrigin,
     id = ~CaseID)

# balance testing example
plot(amce(immigration[!is.na(immigration$ethnocentrism),],
     ethnocentrism ~ Gender + Education + LanguageSkills, id = ~ CaseID))

# reference category sensitivity
x <- amce_by_reference(immigration, ChosenImmigrant ~ LanguageSkills + Education, 
       variable = ~ LanguageSkills, id = ~ CaseID)
# plot
plot(x, group = "BY")
## End(No test)



