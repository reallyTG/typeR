library(matlab)


### Name: padarray
### Title: MATLAB padarray function
### Aliases: padarray padarray,array,numeric,missing,missing-method
###   padarray,array,numeric,ANY,character-method
###   padarray,array,numeric,character,character-method
###   padarray,vector,numeric,ANY,ANY-method
### Keywords: array

### ** Examples

padarray(1:4, c(0, 2))				# 0 0 [1 2 3 4] 0 0
padarray(1:4, c(0, 2), -1)			# -1 -1 [1 2 3 4] -1 -1
padarray(1:4, c(0, 2), -1, "post")		# [1 2 3 4] -1 -1
padarray(1:4, c(0, 3), "symmetric", "pre")	# 3 2 1 [1 2 3 4]
padarray(letters[1:5], c(0, 3), "replicate")	# a a a [a b c d e] e e e
padarray(letters[1:5], c(0, 3), "circular", "post")	# [a b c d e] a b c



