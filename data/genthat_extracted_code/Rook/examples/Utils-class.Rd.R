library(Rook)


### Name: Utils-class
### Title: Class 'Utils'
### Aliases: Utils-class Utils
### Keywords: classes

### ** Examples

Utils$bytesize('foo')
Utils$escape('foo bar')
Utils$unescape('foo+bar')
Utils$escape_html('foo <bar>')
Utils$escape('foo <bar>')
Utils$escape('foo\n<bar>')
Utils$status_code('OK')
Utils$status_code('Found')
Utils$status_code('Not Found')
x <- Utils$parse_query('foo=1&bar=baz')
x
Utils$rfc2822(Sys.time())
Utils$timezero()
Utils$build_query(x)
rm(x)



