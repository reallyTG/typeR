library(sweidnumbr)


### Name: pin_birthplace
### Title: Calculate the birthplace of 'pin'
### Aliases: pin_birthplace

### ** Examples

# Example with someone born today and from SKV 704 (see references)
today_pin <- paste0(format(Sys.Date(),"%Y%m%d"), "0000")
ex_pin <- c("196408233234", today_pin)
pin_birthplace(ex_pin)




