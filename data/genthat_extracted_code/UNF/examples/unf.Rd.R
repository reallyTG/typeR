library(UNF)


### Name: unf
### Title: Universal Numeric Fingerprint
### Aliases: unf unf3 unf4 unf5 unf6

### ** Examples

# Version 6 #

### FORTHCOMING ###

# Version 5 #
## vectors

### just numerics
unf5(1:20) # UNF:5:/FIOZM/29oC3TK/IE52m2A==
unf5(-3:3, dvn_zero = TRUE) # UNF:5:pwzm1tdPaqypPWRWDeW6Jw==

### characters and factors
unf5(c('test','1','2','3')) # UNF:5:fH4NJMYkaAJ16OWMEE+zpQ==
unf5(as.factor(c('test','1','2','3'))) # UNF:5:fH4NJMYkaAJ16OWMEE+zpQ==

### logicals
unf5(c(TRUE,TRUE,FALSE), dvn_zero=TRUE)# UNF:5:DedhGlU7W6o2CBelrIZ3iw==

### missing values
unf5(c(1:5,NA)) # UNF:5:Msnz4m7QVvqBUWxxrE7kNQ==

## variable order and object structure is irrelevant
unf(data.frame(1:3,4:6,7:9)) # UNF:5:ukDZSJXck7fn4SlPJMPFTQ==
unf(data.frame(7:9,1:3,4:6))
unf(list(1:3,4:6,7:9))

# Version 4 #
# version 4
data(longley)
unf(longley, ver=4, digits=3) # PjAV6/R6Kdg0urKrDVDzfMPWJrsBn5FfOdZVr9W8Ybg=

# version 4.1
unf(longley, ver=4.1, digits=3) # 8nzEDWbNacXlv5Zypp+3YCQgMao/eNusOv/u5GmBj9I=

# Version 3 #
x1 <- 1:20
x2 <- x1 + .00001

unf3(x1) # HRSmPi9QZzlIA+KwmDNP8w==
unf3(x2) # OhFpUw1lrpTE+csF30Ut4Q==

# UNFs are identical at specified level of rounding
identical(unf3(x1), unf3(x2))
identical(unf3(x1, digits=5),unf3(x2, digits=5))

# dataframes, matrices, and lists are all treated identically:
unf(cbind.data.frame(x1,x2),ver=3) # E8+DS5SG4CSoM7j8KAkC9A==
unf(list(x1,x2), ver=3)
unf(cbind(x1,x2), ver=3)




