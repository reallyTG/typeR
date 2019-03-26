library(polysat)


### Name: read.ATetra
### Title: Read File in ATetra Format
### Aliases: read.ATetra
### Keywords: file

### ** Examples

# create a file to be read
# (this would normally be done in a text editor or with ATetra's Excel template)
cat("TIT,Sample Rubus Data for ATetra", "LOC,1,CBA15",
"POP,1,1,Commonwealth", "IND,1,1,1,CMW1,197,208,211,213",
"IND,1,1,2,CMW2,197,207,211,212", "IND,1,1,3,CMW3,197,208,212,219",
"IND,1,1,4,CMW4,197,208,212,219", "IND,1,1,5,CMW5,197,208,211,212",
"POP,1,2,Fall Creek Lake", "IND,1,2,6,FCR4,197,207,211,212",
"IND,1,2,7,FCR7,197,208,212,218", "IND,1,2,8,FCR14,197,207,212,218",
"IND,1,2,9,FCR15,197,208,211,212", "IND,1,2,10,FCR16,197,208,211,212",
"IND,1,2,11,FCR17,197,207,212,218","LOC,2,CBA23","POP,2,1,Commonwealth",
"IND,2,1,1,CMW1,98,100,106,125","IND,2,1,2,CMW2,98,125,,",
"IND,2,1,3,CMW3,98,126,,","IND,2,1,4,CMW4,98,106,119,127",
"IND,2,1,5,CMW5,98,106,125,","POP,2,2,Fall Creek Lake",
"IND,2,2,6,FCR4,98,125,,","IND,2,2,7,FCR7,98,106,126,",
"IND,2,2,8,FCR14,98,127,,","IND,2,2,9,FCR15,98,108,117,",
"IND,2,2,10,FCR16,98,125,,","IND,2,2,11,FCR17,98,126,,","END",
file = "atetraexample.txt", sep = "\n")

# Read the file and examine the data
exampledata <- read.ATetra("atetraexample.txt")
summary(exampledata)
PopNames(exampledata)
viewGenotypes(exampledata)



