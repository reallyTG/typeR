library(sjmisc)


### Name: group_str
### Title: Group near elements of string vectors
### Aliases: group_str

### ** Examples

oldstring <- c("Hello", "Helo", "Hole", "Apple",
               "Ape", "New", "Old", "System", "Systemic")
newstring <- group_str(oldstring)

# see result
newstring

# count for each groups
table(newstring)

# print table to compare original and grouped string
frq(oldstring)
frq(newstring)

# larger groups
newstring <- group_str(oldstring, maxdist = 3)
frq(oldstring)
frq(newstring)

# be more strict with matching pairs
newstring <- group_str(oldstring, maxdist = 3, strict = TRUE)
frq(oldstring)
frq(newstring)




