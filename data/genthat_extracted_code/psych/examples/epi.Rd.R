library(psych)


### Name: epi
### Title: Eysenck Personality Inventory (EPI) data for 3570 participants
### Aliases: epi epi.dictionary epiR
### Keywords: datasets

### ** Examples

data(epi)
epi.keys <- list(E = c("V1",  "V3",  "V8",  "V10", "V13", "V17", "V22", "V25", "V27", "V39",
  "V44", "V46", "V49", "V53", "V56", "-V5", "-V15", "-V20", "-V29", "-V32", "-V34","-V37",
   "-V41", "-V51"),
N = c( "V2", "V4", "V7", "V9", "V11", "V14", "V16", "V19", "V21", "V23", "V26", "V28", 
"V31", "V33", "V35", "V38", "V40","V43", "V45", "V47", "V50", "V52","V55", "V57"),
L = c("V6",  "V24", "V36", "-V12", "-V18", "-V30", "-V42", "-V48", "-V54"),
Imp = c( "V1",  "V3",  "V8",  "V10", "V13", "V22", "V39", "-V5", "-V41"),
Soc = c( "V17", "V25", "V27", "V44", "V46", "V53", "-V11", "-V15", "-V20", 
"-V29", "-V32", "-V37", "-V51")
)
scores <- scoreItems(epi.keys,epi)

keys <- make.keys(epi,epi.keys)   #the old way of making keys is to make a matrix
fa.lookup(keys[,1:3],epi.dictionary) #show the items and keying information

#a variety of demonstrations (not run) of test retest reliability versus alpha versus omega

E <- selectFromKeys(epi.keys$E)
#omega(epi[E])  #to show the low omega but high alpha of Extraversion 
#testRetest(epiR,select=E)  #test retest of the extraversion scale (.82) is higher than 
#alpha  for either the first (.77) or second administration (.74)
#Imp <- selectFromKeys(epi.keys$Imp)
#testRetest(epiR,select=Imp)  #Similarly test retest = .68 but alpha = .48 and .50.
#Soc <- selectFromKeys(epi.keys$Soc)
#testRetest(epiR,select=Soc)  # test retest =.83, alpha = .76, .75
#N <- selectFromKeys(epi.keys$N)
#testRetest(epiR, select=N) #Test retest = .8, alpha = .81, .80



