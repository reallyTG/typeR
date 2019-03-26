library(languageR)


### Name: durationsOnt
### Title: Durational measurements on the Dutch prefix ont-
### Aliases: durationsOnt
### Keywords: datasets

### ** Examples

data(durationsOnt)

###### modeling the duration of the prefix

prefix.lm = lm(DurationOfPrefix ~ (YearOfBirth + SpeechRate) * Frequency, 
   data = durationsOnt)
summary(prefix.lm)

# ---- model criticism

plot(prefix.lm)
outliers = c(36, 35, 17, 72)
prefix.lm = lm(DurationOfPrefix ~ (YearOfBirth + SpeechRate) * Frequency, 
   data = durationsOnt[-outliers,])
summary(prefix.lm)

###### modeling the presence of the /t/ 

library(rms)
durationsOnt.dd = datadist(durationsOnt)
options(datadist = 'durationsOnt.dd')

plosive.lrm = lrm(PlosivePresent ~ SpeechRate + YearOfBirth, 
   data = durationsOnt, x = TRUE, y = TRUE)
plosive.lrm
validate(plosive.lrm, bw = TRUE, B = 200)

###### modeling the duration of the /n/

nasal.lm = lm(DurationPrefixNasal ~ PlosivePresent + Frequency + 
   YearOfBirth, data = durationsOnt)
summary(nasal.lm)

# ---- model criticism

plot(nasal.lm)
outliers = c(71, 28, 62, 33)
nasal.lm = lm(DurationPrefixNasal ~ PlosivePresent + Frequency + 
   YearOfBirth, data = durationsOnt[-outliers,])
summary(nasal.lm)




