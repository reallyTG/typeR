library(DescTools)


### Name: StrCap
### Title: Capitalize the First Letter of a String
### Aliases: StrCap
### Keywords: character utilities

### ** Examples

# capitalize first character
StrCap(c("Hello", "bob", "daN"))
# but not all...
StrCap(c("Hello bob, how are you?", "And you, DANIEL?"))

# wordwise
StrCap(c("Capitalize all words in titles of publications and documents",
              "but Up and UP, not all and all", NA), method="word")

# wordwise omitting the ones listed above
StrCap(c("Capitalize all words in titles of publications and documents",
         "but Up and UP, not all and all", NA), method="title")

# do not touch non alphabetic characters
z <- c("Lorem ipsum dolor", "-- sit amet", "consectetur --", " adipiscing elit ",
       "sed,.--(do) / +-*eiusmod")
StrCap(z, method="title")



