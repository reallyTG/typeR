library(algstat)


### Name: teshape
### Title: Interconvert data structures
### Aliases: teshape

### ** Examples

data(Titanic)

# array to others
teshape(Titanic, "freq")
teshape(Titanic, "tab") # what it was
teshape(Titanic, "raw")


# freq to others
TitanicFreq <- teshape(Titanic, "freq")
teshape(TitanicFreq, "freq") # what it was
teshape(TitanicFreq, "tab")  # == Titanic
teshape(TitanicFreq, "raw")

# raw to others
TitanicRaw <- teshape(Titanic, "raw")
teshape(TitanicRaw, "freq")
teshape(TitanicRaw, "tab")
teshape(TitanicRaw, "raw")



