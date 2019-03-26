library(assertive.files)


### Name: assert_is_bzfile_connection
### Title: Is the input a connection?
### Aliases: assert_is_bzfile_connection assert_is_connection
###   assert_is_fifo_connection assert_is_file_connection
###   assert_is_gzfile_connection assert_is_incomplete_connection
###   assert_is_open_connection assert_is_pipe_connection
###   assert_is_readable_connection assert_is_socket_connection
###   assert_is_stderr assert_is_stdin assert_is_stdout
###   assert_is_terminal_connection assert_is_text_connection
###   assert_is_unz_connection assert_is_url_connection
###   assert_is_writable_connection assert_is_xzfile_connection
###   is_bzfile_connection is_connection is_fifo_connection
###   is_file_connection is_gzfile_connection is_incomplete_connection
###   is_open_connection is_pipe_connection is_readable_connection
###   is_socket_connection is_stderr is_stdin is_stdout
###   is_terminal_connection is_text_connection is_unz_connection
###   is_url_connection is_writable_connection is_xzfile_connection

### ** Examples

assert_is_terminal_connection(stdin())
assert_is_readable_connection(stdin())
assert_is_open_connection(stdin())
assert_is_stdin(stdin())
# Next line is usually true but, e.g., devtools::run_examples overrides it
assertive.base::dont_stop(assert_is_terminal_connection(stdout()))
assert_is_writable_connection(stdout())
assert_is_open_connection(stdout())
assert_is_stdout(stdout())
assert_is_terminal_connection(stderr())
assert_is_writable_connection(stderr())
assert_is_open_connection(stderr())
assert_is_stderr(stderr())
tcon <- textConnection("txt", "w", local = TRUE)
assert_is_text_connection(tcon)
assert_is_open_connection(tcon)
cat("this has no final newline character", file = tcon)
assert_is_incomplete_connection(tcon)
close(tcon)
# These examples should fail.
assertive.base::dont_stop({
  assert_is_connection("not a connection")
  assert_is_readable_connection(stdout())
  assert_is_writable_connection(stdin())
})
## Not run: 
##D fcon <- file()
##D close(fcon)
##D assert_is_open_connection(fcon)
## End(Not run)



