library(seqinr)


### Name: trimSpace
### Title: Trim leading and/or trailing spaces in strings
### Aliases: trimSpace
### Keywords: manip

### ** Examples

  #
  # Simple use:
  #
stopifnot( trimSpace("   seqinR   ") == "seqinR" )

  #
  # Basic use, remove space at both ends:
  #
testspace <- c("   with leading space", "with trailing space   ", "   with both   ")
stopifnot(all( trimSpace(testspace) == c("with leading space", 
                                         "with trailing space", 
					 "with both")))

  #
  # Remove only leading space:
  #
stopifnot(all( trimSpace(testspace, trailing = FALSE) == c("with leading space",
                                                           "with trailing space   ",  
							   "with both   ")))

  #
  # Remove only trailing space:
  #
stopifnot(all( trimSpace(testspace, leading = FALSE) == c("   with leading space", 
                                                          "with trailing space",  
							  "   with both")))

  #
  # This should do nothing:
  #
stopifnot(all( trimSpace(testspace, leading = FALSE, trailing = FALSE) == testspace))

  #
  # How to use alternative space characters:
  #
allspaces <- "\t\n\f\r seqinR \t\n\f\r"
stopifnot(trimSpace(allspaces) == "seqinR")
stopifnot(trimSpace(allspaces, space = "\t\n") == "\f\r seqinR \t\n\f\r")



