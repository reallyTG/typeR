library(ring)


### Name: ring_buffer_bytes_typed
### Title: Typed bytes ring buffer
### Aliases: ring_buffer_bytes_typed

### ** Examples

# Create a ring buffer of 30 integers:
b <- ring_buffer_bytes_typed(30, integer(1))

# Alternatively you can create the same buffer this way:
b <- ring_buffer_bytes_typed(30, "integer", 1)

# The buffer is empty to start with
b$is_empty()

# Note that the buffer has a stride of 4 (see ?ring_buffer_bytes)
b$stride()

# Push some numbers into the buffer:
b$push(as.integer(1:10))

# Report the number of elements used:
b$used()

# Get the first added element:
b$tail()

# The buffer behaves basically the same way now as
# "ring_buffer_env" but will typecheck all inputs:
## Not run: 
##D   b$push(pi) # error because not an integer
##D   b$push(1)  # error because not an integer (you must convert to int)
## End(Not run)

# Recycling: the typed buffer operates by converting the input
# vector to a set of bytes and then pushing them onto the buffer;
# this works so long as the vector of bytes has the correct
# length.
b <- ring_buffer_bytes_typed(30, integer(3))

# These both fail because 2 and 4 do not end up as multiples of 3:
## Not run: 
##D   b$push(c(1L, 2L))
##D   b$push(c(1L, 2L, 3L, 4L))
## End(Not run)

# But this is fine:
b$push(seq_len(6))
b$tail()
b$tail_offset(1)



