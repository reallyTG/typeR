library(schoenberg)


### Name: schoenberg
### Title: Generate a 12-tone matrix using Arnold Schoenberg's serialism
###   technique.
### Aliases: schoenberg

### ** Examples

#### Generating Random 12-Tone Matrices ####
# The schoenberg() function can generate completely random 12-tone matrices:
schoenberg()

# Or you can specify a seed value so that your matrices are reproducible:
schoenberg(seed = 42)


#### Generating 12-Tone Matrices From a Specified Vector of Notes ####
# For illustration, let's create two equivalent vectors of note information
# for Schoenberg's first 12-tone serialist work: Walzer from Opus 23.

# First, let's create one vector with note labels:
prime01 <- c("C#", "A", "B", "G", "Ab", "F#", "A#", "D", "E", "Eb", "C", "F")

# Next, let's create an equivalent vector using numeric indices instead of notes:
prime02 <- c(1, 9, 11, 7, 8, 6, 10, 2, 4, 3, 0, 5)


# Now, let's generate a 12-tone matrix from our note-based vector:
schoenberg(prime0 = prime01)

# And let's generate a matrix from our number-based vector:
schoenberg(prime0 = prime02)

# Schoenberg used a mix of sharps and flats in his notation, wich lost in translation with the
# numeric-index approach. Let's re-create our note-based matrix using only sharps:
schoenberg(prime0 = prime01, accidentals = "sharps")

# These two approaches produce identical outputs:
all(schoenberg(prime0 = prime01, accidentals = "sharps") == schoenberg(prime0 = prime02))


# Matrices can also be generated with flat notation by setting accidentals to "flats":
schoenberg(prime0 = prime01, accidentals = "flats")
schoenberg(prime0 = prime02, accidentals = "flats")

# As before, these two approaches produce identical outputs:
all(schoenberg(prime0 = prime01, accidentals = "flats") ==
         schoenberg(prime0 = prime02, accidentals = "flats"))


# We can also manipulate the output of the schoenberg() function
# so that the lead tone of the matrix is a particular note.
# This works with either note-based or number-based input vectors:
schoenberg(prime0 = prime01, tone0 = "C", accidentals = "sharps")
schoenberg(prime0 = prime02, tone0 = "C")

# And, as before, these two approaches produce identical outputs:
all(schoenberg(prime0 = prime01, tone0 = "C", accidentals = "sharps") ==
         schoenberg(prime0 = prime02, tone0 = "C"))



