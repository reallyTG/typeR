library(stheoreme)


### Name: d1char.d1nat
### Title: Probability Mass Function Calculator for Array of Characters
### Aliases: d1char.d1nat

### ** Examples

s0<-c("?", "!", "1", "a", "b", "b", "s", "x", "y", "z", "z", "z")
s1<-c("1", "1", "2", "b", "b", "s", "s", "x", "y", "z", "z", "z", "z")
b<-d1char.d1nat(farr0=s0,farr1=s1); b

s0<-"three witches watch three swatch watches. which witch watch which swatch watch?"
s1<-"who discovered america five hundred years ago? a brave man! indeed he was! discovered!"
b<-d1char.d1nat(unlist(strsplit(s0,"")),unlist(strsplit(s1,"")), 
                reject=c("."," ","!","d","e")); b

#example of 2-step data analysis with Klimontovich's S-theorem
s0<-c("a","b",rep("c",9),rep("d",2),"e","f","g",rep("h",2),"i","j"); s0
s1<-c(rep("a",16), rep("c",35), rep("i",13)); s1

# step a. Create probability vectors. It seems that s0 has lower level
# of orderliness (Shannon entropy is higher)
b<-d1char.d1nat(s0,s1); b
# step b. Compare samples with Klimontovich's S-theorem. Renormalized entropy indicates 
# the opposite: s0 is more ordered and difference in Shannon 
# entropy values was due to just "thermodynamic noise"
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)



