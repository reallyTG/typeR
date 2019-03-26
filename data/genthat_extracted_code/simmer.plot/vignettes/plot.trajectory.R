## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>", 
                      fig.width = 6, fig.height = 8, fig.align = "center")

## ---- message=FALSE------------------------------------------------------
library(simmer)

t0 <- trajectory() %>%
  seize("res0", 1) %>%
  branch(function() 1, c(TRUE, FALSE),
         trajectory() %>%
           clone(2,
                 trajectory() %>%
                   seize("res1", 1) %>%
                   timeout(1) %>%
                   release("res1", 1),
                 trajectory() %>%
                   trap("signal",
                        handler=trajectory() %>%
                          timeout(1)) %>%
                   timeout(1)),
         trajectory() %>%
           set_attribute("dummy", 1) %>%
           seize("res2", function() 1) %>%
           timeout(function() rnorm(1, 20)) %>%
           release("res2", function() 1) %>%
           release("res0", 1) %>%
           rollback(11)) %>%
  synchronize() %>%
  rollback(2) %>%
  release("res0", 1)

## ---- eval=FALSE---------------------------------------------------------
#  library(simmer.plot)
#  
#  get_palette <- scales::brewer_pal(type = "qual", palette = 1)
#  plot(t0, fill = get_palette)

