library(ips)


### Name: trimEnds
### Title: Trim Alignment Ends
### Aliases: trimEnds fillEndsWithN

### ** Examples

# simple example alignment:
# -------------------------
x <- structure(list(nb = 5, 
	seq = c("acaaggtaca", "-caaggtac-", "acaaggtaca", "aca--gtaca", "-ccaggta--"), 
	nam = LETTERS[1:5]), .Names = c("nb", "seq", "nam"), 
	class = "alignment")

# convert to DNAbin:
# ------------------
x <- as.DNAbin(x)

# fill missing nucleotides:
# -------------------------
x <- trimEnds(x)

# show results:
# -------------
as.character(x[2, ])



