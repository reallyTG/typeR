library(gtools)


### Name: mixedsort
### Title: Order or Sort strings with embedded numbers so that the numbers
###   are in the correct order
### Aliases: mixedsort mixedorder
### Keywords: univar manip

### ** Examples

## compound & dose labels
Treatment <- c("Control", "Asprin 10mg/day", "Asprin 50mg/day",
               "Asprin 100mg/day", "Acetomycin 100mg/day",
               "Acetomycin 1000mg/day")

## ordinary sort puts the dosages in the wrong order
sort(Treatment)

## but mixedsort does the 'right' thing
mixedsort(Treatment)

## Here is a more complex example
x <- rev(c("AA 0.50 ml", "AA 1.5 ml", "AA 500 ml", "AA 1500 ml",
           "EXP 1", "AA 1e3 ml", "A A A", "1 2 3 A", "NA", NA, "1e2",
           "", "-", "1A", "1 A", "100", "100A", "Inf"))

mixedorder(x)

mixedsort(x)  # Notice that plain numbers, including 'Inf' show up
              # before strings, NAs at the end, and blanks at the
              # beginning .


mixedsort(x, na.last=TRUE)  # default
mixedsort(x, na.last=FALSE) # push NAs to the front


mixedsort(x, blank.last=FALSE) # default
mixedsort(x, blank.last=TRUE)  # push blanks to the end

mixedsort(x, decreasing=FALSE) # default
mixedsort(x, decreasing=TRUE)  # reverse sort order

## Roman numerals
chapters <- c("V. Non Sequiturs", "II. More Nonsense",
              "I. Nonsense", "IV. Nonesensical Citations",
              "III. Utter Nonsense")
mixedsort(chapters, numeric.type="roman" )

## Lower-case Roman numerals
vals <- c("xix", "xii", "mcv", "iii", "iv", "dcclxxii",   "cdxcii",
          "dcxcviii",   "dcvi",   "cci")
(ordered <- mixedsort(vals, numeric.type="roman", roman.case="lower"))
roman2int(ordered)



