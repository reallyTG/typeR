library(sweidnumbr)


### Name: as.pin
### Title: Parse personal identity numbers to ABS format
### Aliases: as.pin is.pin

### ** Examples

# Examples taken from SKV 704 (see references)
ex_pin1 <- c("196408233234", "640823-3234", "19640823-3234")
as.pin(pin = ex_pin1)
ex_pin2 <- c("6408233234")
as.pin(ex_pin2)
ex_pin3 <- c(6408233234, 196408233234)
as.pin(ex_pin3)
ex_pin4 <-rep(c("20121209-0122", "201212090122", "121209-0122", "1212090122"),250)
as.pin(ex_pin4)
ex_pin5 <-c("205012090122", "186512090122", "121209-0122", "121209-012A")
as.pin(pin = ex_pin5)
pin <-c("201212090122", "201212090122", "121209-0122", "1212090122")




