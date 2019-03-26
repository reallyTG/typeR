library(MTurkR)


### Name: GenerateQualificationRequirement
### Title: Generate QualificationRequirement
### Aliases: GenerateQualificationRequirement
### Keywords: Qualifications

### ** Examples

a <- ListQualificationTypes()[2,2] # Number of HITs Approved
# one QualificationRequirement
q1 <- GenerateQualificationRequirement(a,">","90")
# two QualificationRequirements
q2 <- GenerateQualificationRequirement(c("Locale","Approved"), 
                                       c("==",">"), 
                                       c("US",90), 
                                       preview = TRUE)
# one QualificationRequirement using the 'In' comparator
q3 <- GenerateQualificationRequirement("Locale","In","US,GB")
# two QualificationRequirements using the 'In' comparator
q4 <- GenerateQualificationRequirement(c("Locale","Approved"), 
                                       c("==",">"), 
                                       c("US,GB,DK",90), 
                                       preview = c(TRUE,FALSE))
# `Exists` comparator
q5 <- GenerateQualificationRequirement("Approved", "Exists", "")

# Masters `DoesNotExist` comparator
q6 <- GenerateQualificationRequirement("Masters", "DoesNotExist", "")

# U.S. state locale value
q7a <- GenerateQualificationRequirement("Locale","==","US-MN")
## with multiple states and an 'In' operator
q7b <- GenerateQualificationRequirement("Locale","In","US-MN,US-IL")

# Complex locale values
q8 <- GenerateQualificationRequirement("Locale","In","US-NY,US-WA,CA")



