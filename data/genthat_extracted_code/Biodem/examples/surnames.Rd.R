library(Biodem)


### Name: surnames
### Title: Surname frequency table
### Aliases: surnames
### Keywords: datasets

### ** Examples

data(surnames)

# NB. How did we produce the "surnames" dataset?
# the original data (an hypothetic list of surnames)
# were arranged as:

#  YEAR POP SURNAME
#  1901   3  FABBRI
#  1901   3  VITALI
#  1901   2   LIPPI
#  1901   2  FABBRI
#  1901   2   NARDI
#  1901   2   NARDI
#  1901   1  ANGELI
#  1902   1  ANGELI
#  1902   2  VITALI
#  1902   2   LIPPI
#  1902   1   LIPPI
#  1902   1   LIPPI
#  1902   3  VITALI
#  1902   3  FABBRI
#  1902   2  FABBRI
#  1904   2   NARDI
#  1904   2   NARDI
#  1904   2   LIPPI
#  1905   1  VITALI
#  1905   1  FABBRI
#  1905   3  FABBRI
#  1905   3  ANGELI
#  1905   2   LIPPI
#  1905   2   NARDI
#  1905   3   NARDI
#  1905   3   NARDI

#       ..........

# This arrangement does not necessarily reflect
# the way other people would arrange their data. 
# The "surnames" dataset was generated using
# the "table" function as follows:

# table(data$SURNAME,data$POP)



