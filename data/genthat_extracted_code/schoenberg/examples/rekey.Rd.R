library(schoenberg)


### Name: rekey
### Title: Re-express a "schoenberg" class object with a different lead
###   tone or different notation of accidentals.
### Aliases: rekey

### ** Examples

# Let's create a vector of notes to use in creating our inital 'tone_mat' matrix based
# on Schoenberg's Walzer from Opus 23
prime01 <- c("C#", "A", "B", "G", "Ab", "F#", "A#", "D", "E", "Eb", "C", "F")
tone_mat <- schoenberg(prime0 = prime01)

# Now, let's change the lead tone to "C":
rekey(tone_mat = tone_mat, tone0 = "C")

# And let's also change the accidentals to flats:
rekey(tone_mat = tone_mat, tone0 = "C", accidentals = "flats")



