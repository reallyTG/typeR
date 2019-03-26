library(exams)


### Name: exams2html
### Title: Generation of Exams in HTML Format
### Aliases: exams2html make_exams_write_html make_exercise_transform_html
###   make_exercise_transform_pandoc
### Keywords: utilities

### ** Examples

## load package and enforce par(ask = FALSE)
options(device.ask.default = FALSE)

if(interactive()) {
## compile a single random exam (displayed in the browser)
exams2html(list(
  "boxplots",
  c("tstat", "ttest", "confint"),
  c("regression", "anova"),
  "scatterplot",
  "relfreq"
))

## examples with different locales (UTF-8, ISO-8859-15)
## using special characters (Euro and Pound symbol, German umlaut)
if(!identical(Sys.getlocale(), "C")) {
## UTF-8
exams2html("currency8", encoding = "utf8", template = "plain8")

## ISO Latin 9 (aka ISO-8859-15)
exams2html("currency9", encoding = "latin9", template = "plain9")
}


## various versions of displaying mathematical formulae

## via MathML (displayed correctly in MathML-aware browsers, e.g. Firefox)
exams2html("tstat")

## via MathML + MathJax (should work in all major browsers,
## note the display options you get when right-clicking on the formulas
## in the browser)
exams2html("tstat", mathjax = TRUE)

## via plain HTML (works in all browsers but with inferior formatting)
exams2html("tstat", converter = "tth")

## via HTML with embedded picture (works in all browsers but
## is slow and requires LaTeX and ImageMagick)
## Not run: 
##D exams2html("tstat", converter = "tex2image")
## End(Not run)
}



