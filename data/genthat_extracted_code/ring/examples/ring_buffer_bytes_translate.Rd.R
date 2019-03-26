library(ring)


### Name: ring_buffer_bytes_translate
### Title: Translating bytes ring buffer
### Aliases: ring_buffer_bytes_translate

### ** Examples

# The "typed" ring buffers do not allow for character vectors to
# be stored, because strings are generally hard and have unknown
# lengths.  But if you wanted to store strings that are *always*
# the same length, this is straightforward to do.

# You can convert from string to bytes with charToRaw (or
# as.raw(utf8ToInt(x))):
bytes <- charToRaw("hello!")
bytes

# And back again with rawToChar (or intToUtf8(as.integer(x)))
rawToChar(bytes)

# So with these functions we can make a buffer for storing
# fixed-length strings:
b <- ring_buffer_bytes_translate(100, 8, charToRaw, rawToChar)

# And with this we can store 8 character strings:
b$push("abcdefgh")
b$tail()

# Other length strings cannot be added:
try(
  b$push("hello!")
) # error

# Because the 'from' and 'to' arguments can be arbitrary R
# functions we could tweak this to pad the character vector with
# null bytes, and strip these off on return:
char_to_raw <- function(x, max_len) {
  if (!(is.character(x) && length(x) == 1L)) {
    stop("Expected a single string")
  }
  n <- nchar(x)
  if (n > max_len) {
    stop("String is too long")
  }
  c(charToRaw(x), rep(raw(1), max_len - n))
}
char_from_raw <- function(x) {
  rawToChar(x[x != raw(1)])
}

# Because max_len is the same thing as stride, wrap this all up a
# little:
char_buffer <- function(size, max_len) {
  to <- function(x) char_to_raw(x, max_len)
  ring_buffer_bytes_translate(size, max_len, to, char_from_raw)
}

b <- char_buffer(100, 30) # 100 elements of up to 30 characters each
b$push("x")
b$tail()

b$push("hello world!")
b$head()

try(
  b$push("supercalafragalisticexpealadocious")
) # error: string is too long



