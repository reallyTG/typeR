library(decoder)


### Name: code
### Title: Decode codes to plain text (and vice versa)
### Aliases: code decode decode.data.frame decode.default

### ** Examples


KON_VALUE <- sample(1:2, 20, replace = TRUE)
(kon <- decode(KON_VALUE, "kon"))
code(kon, "kon")

# Get a sample of Snomed-codes (in the real world we obviously avoid this step) ...
snomed2 <- sample(decoder:::snomed$key, 30, replace = TRUE)
# ... then decode them:
(snomed3 <- decode(snomed2, "snomed"))


# Health care regions can be defined in more than one way
# By default Kungalv define a region of its own:
set.seed(123456789)
healtcare_areas_west <- sample(unlist(decoder:::sjukvardsomrade), 100, replace = TRUE)
(areas <- decode(healtcare_areas_west, "sjukvardsomrade"))
table(areas)

# But if we want Kungalv to be a part of Storgoteborg
# (which is common practice for example with lung cancer data):
(areas2 <- decode(healtcare_areas_west, "sjukvardsomrade", "kungalv2Storgoteborg"))
table(areas2)

# We can also combine several extra_functions if we for example
# also want the area names with correct Swedish spelling.
(areas3 <- decode(healtcare_areas_west, "sjukvardsomrade", c("kungalv2Storgoteborg", "real_names")))


# The region names can be both with and without prefix:
regs <- sample(6, 10, replace = TRUE)
decode(regs, "region") # With prefix
decode(regs, "region", "short_region_names") # without prefix

# Note that only the first four digits of the LKF-code were used abowe?
# What if we use the full LKF-code?
lkfs <- sample(decoder:::forsamling$key, 100, replace = TRUE)
decode(lkfs, "sjukvardsomrade")
# That work's just as fine when argument exact = FALSE (which it is by default).

# decode can also be used for data.frames with recognised column names
d <- data.frame(
     kon = sample(1:2, 10, replace = TRUE), 
     sex = sample(1:2, 10, replace = TRUE),
     lkf = sample(decoder:::hemort$key, 10, replace = TRUE)
 )
 decode(d)

### --- code --- ###
# Sometimes we have keyvalue objects with some key-value pairs without a 1:1 relation.
# This is true for snomed
# Show all non 1:1 pairs:
summary(decoder:::snomed)$nonunique
# Save them for later:
non_unique_snomeds <- summary(decoder:::snomed)$nonunique$key

# Use these snomed codes for decoding and coding
# Decoding works fine (all keys are unique) ...
(a <- decode(non_unique_snomeds, "snomed"))
# ... but coding these values back to their key does not
## Not run: 
##D code(a, "snomed")
## End(Not run)



