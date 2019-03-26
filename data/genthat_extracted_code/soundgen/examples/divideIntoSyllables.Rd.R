library(soundgen)


### Name: divideIntoSyllables
### Title: Syllable structure of a bout
### Aliases: divideIntoSyllables
### Keywords: internal

### ** Examples

soundgen:::divideIntoSyllables (nSyl = 1, sylLen = 180)
soundgen:::divideIntoSyllables (nSyl = 5, sylLen = 180,
  pauseLen = 55, temperature = 0.2, plot = TRUE)
soundgen:::divideIntoSyllables (nSyl = 5, sylLen = 180,
  pauseLen = 55, temperature = 0)
soundgen:::divideIntoSyllables (nSyl = 3, sylLen = 100,
  pauseLen = 25, temperature = 0.5)

# sylLen and pauseLen are vectorized:
soundgen:::divideIntoSyllables (nSyl = 15, sylLen = 100:200,
  pauseLen = c(80, 25, 80), temperature = 0.05, plot = TRUE)



