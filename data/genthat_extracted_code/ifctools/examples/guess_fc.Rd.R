library(ifctools)


### Name: guess_fc
### Title: Guess Italian Fiscal Code
### Aliases: guess_fc

### ** Examples


## using fictious data
Surnames <- c("Rossi", "Bianchi")
Names <- c("Mario", "Giovanna")
Birthdates <- as.Date(c("1960-01-01", "1970-01-01"))
Female <- c(FALSE, TRUE)
Comune_of_birth <- c("F205", # milan
                     "H501") # rome
guess_fc(Surnames, Names, Birthdates, Female, Comune_of_birth)




