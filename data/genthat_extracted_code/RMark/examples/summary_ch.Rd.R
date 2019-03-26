library(RMark)


### Name: summary_ch
### Title: Provides a summary for the capture histories
### Aliases: summary_ch summary.ch
### Keywords: utility

### ** Examples


data(dipper)
dipper.processed=process.data(dipper,groups=("sex"))
summary_ch(dipper.processed)
#$sexFemale
#  Released 2  3 4  5  6  7 Total
#1       10 5  3 3  2  1  0     6
#2       29 0 11 6  6  4  2    11
#3       27 0  0 9  5  3  2     9
#4       23 0  0 0 11  7  4    13
#5       19 0  0 0  0 12  6    12
#6       23 0  0 0  0  0 11    11
#
#$sexMale
#  Released 2 3  4  5  6  7 Total
#1       12 6 3  2  1  1  0     7
#2       20 0 9  2  1  0  0     9
#3       25 0 0 13  6  2  0    14
#4       22 0 0  0 15  9  7    16
#5       22 0 0  0  0 13 10    13
#6       23 0 0  0  0  0 12    12
summary_ch(dipper.processed,marray=TRUE)
#$sexFemale
#  Released 2  3  4  5  6  7 Total
#1       10 5  1  0  0  0  0     6
#2       34 0 13  1  0  0  0    14
#3       41 0  0 17  1  0  0    18
#4       41 0  0  0 23  1  1    25
#5       43 0  0  0  0 26  0    26
#6       50 0  0  0  0  0 24    24
#
#$sexMale
#  Released 2  3  4  5  6  7 Total
#1       12 6  1  0  0  0  0     7
#2       26 0 11  0  0  0  0    11
#3       37 0  0 17  1  0  0    18
#4       39 0  0  0 22  0  1    23
#5       45 0  0  0  0 25  0    25
#6       48 0  0  0  0  0 28    28




