library(ring)


### Name: ring_buffer_env
### Title: Environment-based ring buffer
### Aliases: ring_buffer_env

### ** Examples

buf <- ring_buffer_env(10)
buf$push(1:10)
buf$take(3)
buf$push(11:15)
buf$take(2)

# The "on_overflow" argument by default allows for the buffer to
# overwrite on overflow.
buf <- ring_buffer_env(10)
buf$push(1:10)
unlist(buf$read(buf$used())) # 1:10
# Over-write the first 5
buf$push(11:15)
unlist(buf$read(buf$used())) # 6:15

# Unlike ring_buffer_bytes, these ring buffers can hold any R
# object.  However, you must be careful about use of iterate!
buf$push(lm(mpg ~ cyl, mtcars), iterate = FALSE)
buf$take(1)

# Alternatively, grow the buffer as overwriting happens
buf <- ring_buffer_env(10, "grow")
buf$push(1:10)
buf$push(11:15)
unlist(buf$read(buf$used())) # 1:15

# Or throw an error on overflow
buf <- ring_buffer_env(10, "error")
buf$push(1:10)
try(buf$push(11:15))

# The errors that are thrown on underflow / overflow are typed so
# can be caught by tryCatch:
tryCatch(buf$read(100),
         ring_underflow = function(e) message("nope"))
tryCatch(buf$push(100),
         ring_overflow = function(e) message("nope again"))



