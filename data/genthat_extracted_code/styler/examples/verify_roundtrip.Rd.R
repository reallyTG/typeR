library(styler)


### Name: verify_roundtrip
### Title: Verify the styling
### Aliases: verify_roundtrip
### Keywords: internal

### ** Examples

styler:::verify_roundtrip("a+1", "a + 1")
styler:::verify_roundtrip("a+1", "a + 1 # comments are dropped")
## Not run: 
##D styler:::verify_roundtrip("a+1", "b - 3")
## End(Not run)



