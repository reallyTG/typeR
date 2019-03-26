# All "dots" should have the exact same xy's. Run test to determine if xy's are
# all the same among "dots".
library(ggloop)
library(ggplot2)
context("List mappings")
# xydot -----------------------------------------------------------------


xydot.TF <- ggloop::ggloop(mtcars,
                                 ggloop::aes_loop(x = mpg:hp,
                                                  y = mpg:cyl,
                                                  color = am:carb),
                                 gg_obj = FALSE,
                                 TRUE,
                                 FALSE)

xydot.TT <- ggloop::ggloop(mtcars,
                                 ggloop::aes_loop(x = mpg:hp,
                                                  y = mpg:cyl,
                                                  color = am:carb),
                                 gg_obj = FALSE,
                                 TRUE,
                                 TRUE)

xydot.FF <- ggloop::ggloop(mtcars,
                                 ggloop::aes_loop(x = mpg:disp,
                                                  y = mpg:hp,
                                                  color = am:carb),
                                 gg_obj = FALSE,
                                 FALSE,
                                 FALSE)

xydot.NAT <- ggloop::ggloop(mtcars,
                                  ggloop::aes_loop(x = mpg:hp,
                                                   y = mpg:cyl,
                                                   color = am:carb),
                                  gg_obj = FALSE,
                                  NA,
                                  TRUE)

xydot.NAF <- ggloop::ggloop(mtcars,
                                  ggloop::aes_loop(x = mpg:disp,
                                                   y = mpg:hp,
                                                   color = am:carb),
                                  gg_obj = FALSE,
                                  NA,
                                  FALSE)

# xydots ----------------------------------------------------------------


xydots.TF <- ggloop::ggloop(mtcars,
                                  ggloop::aes_loop(x = mpg:hp,
                                                   y = mpg:hp,
                                                   color = am:carb,
                                                   size = vs:am),
                                  gg_obj = FALSE,
                                  TRUE,
                                  FALSE)

xydots.TT <- ggloop::ggloop(mtcars,
                                  ggloop::aes_loop(x = mpg:hp,
                                                   y = mpg:hp,
                                                   color = am:carb,
                                                   size = vs:am),
                                  gg_obj = FALSE,
                                  TRUE,
                                  TRUE)

xydots.FF <- ggloop::ggloop(mtcars,
                                  ggloop::aes_loop(x = mpg:hp,
                                                   y = mpg:hp,
                                                   color = am:carb,
                                                   size = vs:am),
                                  gg_obj = FALSE,
                                  FALSE,
                                  FALSE)

xydots.NAT <- ggloop::ggloop(mtcars,
                                   ggloop::aes_loop(x = mpg:hp,
                                                    y = mpg:hp,
                                                    color = am:carb,
                                                    size = vs:am),
                                   gg_obj = FALSE,
                                   NA,
                                   TRUE)

xydots.NAF <- ggloop::ggloop(mtcars,
                                   ggloop::aes_loop(x = mpg:hp,
                                                    y = mpg:hp,
                                                    color = am:carb,
                                                    size = vs:am),
                                   gg_obj = FALSE,
                                   NA,
                                   FALSE)


# xy ---------------------------------------------------------------------


xy.TF <- ggloop::ggloop(mtcars,
                             ggloop::aes_loop(x = mpg,
                                              y = cyl:hp),
                             gg_obj = FALSE,
                             TRUE,
                             FALSE)

xy.TT <- ggloop::ggloop(mtcars,
                             ggloop::aes_loop(x = mpg,
                                              y = cyl:hp),
                             gg_obj = FALSE,
                             TRUE,
                             TRUE)

xy.FF <- ggloop::ggloop(mtcars,
                             ggloop::aes_loop(x = mpg,
                                              y = cyl:hp),
                             gg_obj = FALSE,
                             FALSE,
                             FALSE)

xy.NAT <- ggloop::ggloop(mtcars,
                              ggloop::aes_loop(x = mpg,
                                               y = cyl:hp),
                              gg_obj = FALSE,
                              NA,
                              TRUE)

xy.NAF <- ggloop::ggloop(mtcars,
                              ggloop::aes_loop(x = mpg,
                                               y = cyl:hp),
                              gg_obj = FALSE,
                              NA,
                              FALSE)
