library(ring)


### Name: ring_buffer_bytes
### Title: Byte array based ring buffer
### Aliases: ring_buffer_bytes

### ** Examples

# Create a ring buffer of 100 bytes
b <- ring_buffer_bytes(100)

# Get the length, number of used and number of free bytes:
b$size()
b$used()
b$free()

# Nothing is used because we're empty:
b$is_empty()

# To work with a bytes buffer you need to use R's raw vectors;
# here are 30 random bytes:
bytes <- as.raw(as.integer(sample(256, 30, TRUE) - 1L))
bytes

# Push these onto the bytes buffer:
b$push(bytes)
b$used()

# The head of the buffer points at the most recently added item
b$head()
bytes[[length(bytes)]]

# ...and the tail at the oldest (first added in this case)
b$tail()
bytes[[1]]

# Elements are taken from the tail; these will be the oldest items:
b$take(8)
bytes[1:8]
b$used()

# To read from the buffer without removing elements, use read:
b$read(8)
bytes[9:16]

# It is not possible to take or read more elements than are
# present in the buffer; it will throw an error:
## Not run: 
##D b$read(50) # error because there are only 22 bytes present
## End(Not run)

# More elements can be pushed on:
b$push(as.raw(rep(0, 50)))
b$used()
b$read(b$used())

# If many new elements are added, they will displace the old elements:
b$push(as.raw(1:75))
b$read(b$used())



