library(cwhmisc)


### Name: cpos
### Title: Find the position of a substring
### Aliases: cpos cposV cposR issubstr
### Keywords: misc character

### ** Examples

  cpos(" Baldrian","a",5) #  3
  cpos("Baldrian","B",15) # NA
  cposR(" Baldabcrian  abcf","abc")
#$first  6 15
#$last   8 17
  cposR(" Baldabcrian  abcf","abc",c(2:16))
#$first 6
#$last  8
  cposV(c("Xcdbeesh","withh "),c("X","h","ees"),c(1,5))
# 1 4 5
issubstr("Today is a wonderful day","wonder")



