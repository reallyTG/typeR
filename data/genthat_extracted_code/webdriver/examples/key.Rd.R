library(webdriver)


### Name: key
### Title: Special keys, so that we can refer to them with an easier syntax
### Aliases: key
### Keywords: datasets

### ** Examples

## Not run: 
##D el$sendKeys("xyz")
##D el$sendKeys("x", "y", "z")
##D el$sendKeys("username", key$enter, "password", key$enter)
##D 
##D ## Sending CTRL+A
##D el$sendKeys(key$control, "a")
##D 
##D ## Note that modifier keys (control, alt, shift, meta) are sticky,
##D ## they remain in effect in the rest of the sendKeys() call. E.g.
##D ## this sends CTRL+X and CTRL+S
##D el$sendKeys(key$control, "x", "s")
##D 
##D ## You will need multiple calls to release control and send CTRL+X S
##D el$sendKeys(key$control, "x")
##D el$sendKeys("s")
## End(Not run)




