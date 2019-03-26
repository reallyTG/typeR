library(R2HTML)


### Name: HTM2clip
### Title: Wrapper around HTML() to save output to the clipboard
### Aliases: HTML2clip
### Keywords: print IO file

### ** Examples

if (.Platform$OS == "windows")
	HTML2clip(summary(lm(rating ~., attitude)))



