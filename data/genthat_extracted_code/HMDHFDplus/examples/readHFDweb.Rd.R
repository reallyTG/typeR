library(HMDHFDplus)


### Name: readHFDweb
### Title: read an HFD data file directly from the web as an R data.frame
### Aliases: readHFDweb

### ** Examples

### # this will ask you to enter your login details in the R console
### DAT <- readHFDweb("JPN","tfrRR") 
###
### # ----------------------------------------
### # this is a good way to reuse your login credentials without 
### # having to reveal them in your R script.
### # if you want to do this in batch then I'm 
### # afraid you'll have to find a clever way to 
### # pass in your credentials without an interactive 
### # session, such as reading them in from a system file of your own.
### myusername <- userInput()
### mypassword <- userInput()
### DAT <- readHMDweb("USA","mltper_1x1",mypassword,myusername)
###
### #-----------------------------------------
### # this also works, but you'll need to make two selections, 
### # plus enter data in the console twice:
### DAT <- readHFDweb()




