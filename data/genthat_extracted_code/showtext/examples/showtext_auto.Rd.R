library(showtext)


### Name: showtext_auto
### Title: Automatically Using 'showtext' for New Graphics Devices
### Aliases: showtext_auto showtext.auto

### ** Examples

## Not run: 
##D pdf("test1.pdf")
##D plot(1, main = "\u6b22\u8fce")  ## may not render properly
##D dev.off()
##D 
##D ## Automatically use showtext for future devices
##D showtext_auto()
##D plot(1, main = "\u6b22\u8fce", family = "wqy-microhei")
##D 
##D pdf("test2.pdf")
##D plot(1, main = "\u6b22\u8fce", family = "wqy-microhei")
##D dev.off()
##D 
##D ## Turn off if needed
##D showtext_auto(FALSE)
## End(Not run)



