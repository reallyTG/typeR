## ----install,eval=FALSE--------------------------------------------------
#  
#  install.packages('hrbrthemes')
#  
#  if(!require(devtools)) {
#    install.packages("devtools")
#  }
#  devtools::install_github('bhaskarvk/fontMPlus')
#  
#  
#  # Required only once to import basic latin glpyh fonts included with this package.
#  fontMPlus::import_mplus()
#  
#  # To import complete glyph set including Kana/Kanji glyphs use one of the two approaches below.
#  # NOTE: You don't need to do this if you don't need Kana/Kanji glyphs.
#  
#  # Download and extract https://osdn.net/projects/mplus-fonts/downloads/62344/mplus-TESTFLIGHT-062.tar.xz/ to some directory.
#  fontMPlus::import_mplus(font_dir='directory containing M+ fonts')
#  
#  # OR
#  
#  # git clone this repo.
#  # cd fontMPlus (where fontMPlus is the directory where you have cloned this repo)
#  fontMPlus::import_mplus(font_dir='data-raw/complete-glpyhs')

## ----c1, fig.retina=1, fig.width=6, fig.height=4-------------------------
library(ggplot2)
library(fontMPlus)

gg <- ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
       title="Seminal ggplot2 scatterplot example",
       subtitle="A plot that is only useful for demonstration purposes",
       caption="Brought to you by the letter 'g'")

gg + theme_ipsum_mplus_c1()

## ----c2, fig.retina=1, fig.width=6, fig.height=4-------------------------
gg + theme_ipsum_mplus_c2()

## ----p1, fig.retina=1, fig.width=6, fig.height=4-------------------------
gg + theme_ipsum_mplus_p1()

## ----p2, fig.retina=1, fig.width=6, fig.height=4-------------------------
gg + theme_ipsum_mplus_p2()

## ----m1, fig.retina=1, fig.width=6, fig.height=4-------------------------
gg + theme_ipsum_mplus_m1()

## ----m2, fig.retina=1, fig.width=6, fig.height=4-------------------------
gg + theme_ipsum_mplus_m2()

## ----mn1, fig.retina=1, fig.width=6, fig.height=4------------------------
gg + theme_ipsum_mplus_mn1()

