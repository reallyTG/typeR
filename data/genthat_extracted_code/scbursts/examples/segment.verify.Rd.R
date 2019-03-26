library(scbursts)


### Name: segment.verify
### Title: Detect misrecorded data.
### Aliases: segment.verify

### ** Examples


# It's more likely that you created states or dwells with some function
states  <-  c(0,      1,    0,    1,    0,    1,    0,    1,    0,    1)
dwells  <-  c(0.1,  1.1,  0.5,  0.2,  1.0,  1.1,  0.6,  1.1,  0.8,  1.1)
my_burst <- segment.create(states, dwells, seg=1, start_time=3.14159, name="example_segment")

segment.verify(my_burst)

# Now, a bad burst with two adjacent open dwells
states  <-  c(0,      1,    0,    1,    1,    0,    1,    0,    1)
dwells  <-  c(0.1,  1.1,  0.5,  0.2,  1.1,  0.6,  1.1,  0.8,  1.1)

# This will issue a warning
faulty_burst <- segment.create(states, dwells, seg=1, start_time=3.14159, name="faulty_segment")

# This will differentiate good and faulty bursts
segment.verify(faulty_burst)

# If you have a list of bursts, you can select the good ones with
# vbursts <- bursts.select(bursts, segment.verify)




