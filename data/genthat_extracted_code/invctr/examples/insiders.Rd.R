library(invctr)


### Name: insiders
### Title: Inside interval
### Aliases: insiders %[]% %()% %[)% %(]% %[.]% %(.)% %[.)% %(.]%

### ** Examples


# Closed interval
0:5 %[]% c(1,5)  # logical vector
0:5 %[.]% c(1,5) # extract values

# Open interval
0:5 %()% c(1,5)
0:5 %(.)% c(1,5)

# Closed interval left
0:5 %[)% c(1,5)
0:5 %[.)% c(1,5)

# Closed interval right
0:5 %(]% c(1,5)
0:5 %(.]% c(1,5)





