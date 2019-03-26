library(RTextTools)


### Name: wordStem
### Title: Get the common root/stem of words
### Aliases: wordStem
### Keywords: IO utilities

### ** Examples


   # Simple example
   # "win"    "win"    "winner"
 wordStem(c("win", "winning", 'winner'))


  # test the supplied vocabulary.
 testWords = readLines(system.file("words", "english", "voc.txt", package = "RTextTools"))
 validate = readLines(system.file("words", "english", "output.txt", package = "RTextTools"))

## Not run: 
##D  # Read the test words directly from the snowball site over the Web
##D  testWords = readLines(url("http://snowball.tartarus.org/english/voc.txt"))
## End(Not run)


 testOut = wordStem(testWords)
 all(validate == testOut)

  # Specify the language from one of the built-in languages.
 testOut = wordStem(testWords, "english")
 all(validate == testOut)

  # To illustrate using the dynamic lookup of symbols that allows one
  # to easily add new languages or create and close environment
  # routines (for example, to manage pools if this were an efficiency
  # issue!)
 testOut = wordStem(testWords, c("testDynCreate", "testDynClose", "testDynStem"))



