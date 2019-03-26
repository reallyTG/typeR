library(xplain)


### Name: xplain.getcall
### Title: Generating function calls for xplain wrapper functions
### Aliases: xplain.getcall

### ** Examples

library(car)

# Example of a wrapper function for lm()
lm.xplain <- function(formula, data, subset, weights, na.action,
                      method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
                      singular.ok = TRUE, contrasts = NULL, offset, ...) {
  call<-xplain.getcall("lm")
  xplain(call, xml="http://www.zuckarelli.de/xplain/example_lm.xml")
}

lm.xplain(education ~ young + income + urban, data=Anscombe)




