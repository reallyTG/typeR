## ----setup, echo = FALSE, warning = FALSE, message = FALSE---------------

library(knitr)
library(dplyr)
library(huxtable)
options(huxtable.knit_print_df = FALSE)

is_latex <- guess_knitr_output_format() == 'latex'
# is_latex <- TRUE
knitr::knit_hooks$set(
  barrier = function(before, options, envir) {
    if (! before && is_latex) knitr::asis_output('\\FloatBarrier')
  }
)

if (is_latex) knitr::opts_chunk$set(barrier = TRUE)


## ---- echo = FALSE-------------------------------------------------------
huxtable::hux_logo(latex = is_latex, html = ! is_latex)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages('huxtable')

## ------------------------------------------------------------------------
library(huxtable)
ht <- hux(
        Employee     = c('John Smith', 'Jane Doe', 'David Hugh-Jones'), 
        Salary       = c(50000L, 50000L, 40000L),
        add_colnames = TRUE
      )

## ------------------------------------------------------------------------
data(mtcars)
car_ht <- as_hux(mtcars)

## ---- results = 'markup'-------------------------------------------------
print_screen(ht)     # on the R command line, you can just type "ht"

## ------------------------------------------------------------------------
ht

## ------------------------------------------------------------------------
right_padding(ht) <- 10
left_padding(ht)  <- 10

## ------------------------------------------------------------------------
number_format(ht) <- 2    # 2 decimal places

## ------------------------------------------------------------------------
bold(ht)[1, ]          <- TRUE
bottom_border(ht)[1, ] <- 1

## ------------------------------------------------------------------------
ht

## ------------------------------------------------------------------------

caption(ht) <- 'Employee table'
ht


## ---- echo = FALSE-------------------------------------------------------
sides <- c('left_', 'right_', 'top_', 'bottom_')
props <- list()
props[['Cell_Text']] <- sort(c('font', 'text_color', 'wrap', 'bold', 'italic', 'font', 'font_size', 'na_string', 'escape_contents', 'number_format', 'rotation'))

props[['Cell']] <- sort(c('align', 'valign', 'rowspan', 'colspan', 'background_color', 
      paste0(sides, 'border'), paste0(sides, 'border_color'), paste0(sides, 'border_style'), 
      paste0(sides, 'padding')))
props[['Row']]    <- 'row_height'
props[['Column']] <- 'col_width'
props[['Table']]  <- sort(c('width', 'height', 'position', 'caption', 'caption_pos', 'tabular_environment', 'label', 'latex_float'))

maxl <- max(sapply(props, length))
props <- lapply(props, function(x) c(x, rep('', maxl - length(x))))

ss_font <- if (guess_knitr_output_format() == 'latex') 'cmtt' else 'courier'

prop_hux <- hux(as.data.frame(props))                     %>% 
      add_colnames                                        %>% 
      {foo <- .; foo[1,] <- gsub('_', ' ', foo[1,]); foo} %>% 
      set_font(-1, everywhere, ss_font)                   %>% 
      set_font_size( 10)                                  %>% 
      set_bold(1, everywhere, TRUE)                       %>% 
      set_width(0.9)                                      %>% 
      set_background_color(-1, evens, grey(.9))           %>% 
      set_outer_borders(1)                                %>% 
      set_bottom_border(1, everywhere, 1)                 %>% 
      set_top_padding(2)                                  %>% 
      set_bottom_padding(4)                               %>% 
      set_caption('Huxtable properties')                  %>% 
      set_position('left') %>% 
      set_col_width(c(.2, .25, .15, .15, .25))

prop_hux

## ------------------------------------------------------------------------

library(dplyr)
hux(
        Employee     = c('John Smith', 'Jane Doe', 'David Hugh-Jones'), 
        Salary       = c(50000, 50000, 40000),
        add_colnames = TRUE
      )                               %>%
      set_right_padding(10)           %>%
      set_left_padding(10)            %>% 
      set_bold(1, 1:2, TRUE)          %>% 
      set_bottom_border(1, 1:2, 1)    %>%
      set_align(1:4, 2, 'right')      %>%
      set_number_format(2)            %>% 
      set_caption('Employee table')


## ---- results = 'markup'-------------------------------------------------
italic(ht)
position(ht)

## ------------------------------------------------------------------------
ht[3, 1] <- 'Jane Jones'
ht

## ------------------------------------------------------------------------
ht_with_roles <- ht
ht_with_roles$Role <- c("Role", "Admin", "CEO", "Dogsbody")
ht_with_roles

## ------------------------------------------------------------------------
ht_with_roles <- cbind(ht, c("Role", "Admin", "CEO", "Dogsbody"))
ht_with_roles

## ------------------------------------------------------------------------
rbind(ht, c("Yihui Xie", 100000))

## ------------------------------------------------------------------------

to_insert <- hux(
        Role  = c("Admin", "CEO", "Dogsbody"),
        Hired = as.Date(c("2015-01-01", "2008-06-05", "2012-07-31")),
        add_colnames = TRUE
      ) %>% 
      set_bold(1, 1:2, TRUE) %>% 
      set_bottom_border(1, 1:2, TRUE)

cbind(ht[, 1], to_insert, ht[, 2:ncol(ht)])

## ------------------------------------------------------------------------

add_columns(ht, to_insert, after = 1)


## ------------------------------------------------------------------------

add_columns(ht, to_insert, after = "Employee")


## ------------------------------------------------------------------------

car_ht <- as_hux(mtcars)                
car_ht <- huxtable::add_rownames(car_ht, "Car")
# Select columns by name:
car_ht <- car_ht[, c("Car", "mpg", "cyl", "am")] 

# Order by number of cylinders:
car_ht <- car_ht[order(car_ht$cyl), ]

car_ht <- huxtable::add_colnames(car_ht)

# Pretty output, see below: 
theme_plain(car_ht[1:5,])

## ------------------------------------------------------------------------

car_ht <- as_hux(mtcars)
car_ht <- huxtable::add_rownames(car_ht, colname = "Car")

car_ht <- car_ht                                          %>%
      slice(1:10)                                         %>% 
      select(Car, mpg, cyl, hp)                           %>% 
      arrange(hp)                                         %>% 
      filter(cyl > 4)                                     %>% 
      rename(MPG = mpg, Cylinders = cyl, Horsepower = hp) %>% 
      mutate(kml = MPG/2.82)                              %>% 
      huxtable::add_colnames()                            

theme_plain(car_ht)

## ------------------------------------------------------------------------
htn <- hux(c(
        "Some numbers...", 
        11.003, 
        300, 
        12.02, 
        "12.1 **", 
        "mean 11.7 (se 2.3)"
      )) 

number_format(htn) <- 3
theme_plain(htn)

## ------------------------------------------------------------------------
align(htn)[2:6, ] <- "." # not the first row

theme_plain(htn)

## ------------------------------------------------------------------------

my_data <- data.frame(
        Employee    = c("John Smith", "Jane Doe", "David Hugh-Jones"), 
        Salary      = c(50000L, 50000L, 40000L),
        Performance = c(8.9, 9.2, 7.8)  
      )

as_hux(my_data, add_colnames = TRUE) # with automatic formatting

as_hux(my_data, add_colnames = TRUE, autoformat = FALSE) # no automatic formatting

## ------------------------------------------------------------------------
code_ht <- if (is_latex) hux(c("Some maths", "$a^b$")) else 
      hux(c("Copyright symbol", "&copy;"))

theme_plain(code_ht)

## ------------------------------------------------------------------------
escape_contents(code_ht)[2, 1] <- FALSE

theme_plain(code_ht)

## ------------------------------------------------------------------------
width(ht) <- 0.4
col_width(ht) <- c(.7, .3)
ht

## ------------------------------------------------------------------------
ht_wrapped <- ht
ht_wrapped[5, 1] <- "David Arthur Shrimpton Hugh-Jones"
wrap(ht_wrapped) <- TRUE
ht_wrapped

## ------------------------------------------------------------------------
as_hux(mtcars[1:4, 1:4])                           %>% 
      huxtable::add_rownames(colname = "Car name") %>% 
      huxtable::add_colnames()

## ------------------------------------------------------------------------

car_ht <- as_hux(mtcars)
car_ht <- huxtable::add_rownames(car_ht, colname = "Car")
car_ht <- car_ht %>% arrange(cyl) %>% select(1:4)
car_ht <- huxtable::add_colnames(car_ht)

car_ht <- cbind(cylinders = car_ht$cyl, car_ht)
car_ht$cylinders[1]   <- ""
car_ht$cylinders[2]   <- "Four cylinders"
car_ht$cylinders[13]  <- "Six cylinders"
car_ht$cylinders[20]  <- "Eight cylinders"

car_ht <- car_ht %>%  
  merge_cells(2:12, 1) %>% 
  merge_cells(13:19, 1) %>% 
  merge_cells(20:33, 1)


car_ht <- rbind(c("List of cars", "", "", "", ""), car_ht)
car_ht <- merge_cells(car_ht, 1, 1:5)
align(car_ht)[1, 1] <- "center"

# a little more formatting:

# car_ht <- set_all_padding(car_ht, 2)
# car_ht <- set_all_borders(car_ht, 1)
# valign(car_ht)[1,] <- "top"
# col_width(car_ht) <- c(.4 , .3 , .1, .1, .1)
# number_format(car_ht)[, 4:5] <- 0
# bold(car_ht)[1:2, ] <- TRUE
# bold(car_ht)[, 1] <- TRUE
# if (is_latex) font_size(car_ht) <- 10

car_ht <- theme_plain(car_ht)
right_border(car_ht)[1, 1] <- 0.4
bottom_border(car_ht)[21, 1] <- 0.4
car_ht

## ------------------------------------------------------------------------
theme_mondrian(ht)

## ------------------------------------------------------------------------
ht %>% set_background_color(everywhere, starts_with("S"), "orange")

## ------------------------------------------------------------------------
ht %>% map_background_color(by_rows("grey90", "grey95"))

## ------------------------------------------------------------------------

car_ht %>% map_text_color(everywhere, 3, 
        by_ranges(c(15, 25), c("red", "darkgreen", "green"))
      )


## ------------------------------------------------------------------------
ht %>% map_bold(by_regex('Jones' = TRUE))

## ------------------------------------------------------------------------

lm1 <- lm(mpg ~ cyl, mtcars)
lm2 <- lm(mpg ~ hp, mtcars)
lm3 <- lm(mpg ~ cyl + hp, mtcars)

huxreg(lm1, lm2, lm3)

## ---- include = FALSE----------------------------------------------------
options(huxtable.knit_print_df = TRUE)

## ------------------------------------------------------------------------
head(mtcars)

## ------------------------------------------------------------------------
options(huxtable.knit_print_df = FALSE)

head(mtcars) # back to normal

## ---- include = FALSE----------------------------------------------------
options(huxtable.knit_print_df = TRUE)

## ---- results = 'markup'-------------------------------------------------
print_screen(ht)

## ---- echo = FALSE-------------------------------------------------------
quick_commands <- hux(
        Command = c("quick_pdf", "quick_docx", "quick_html", "quick_xlsx", "quick_pptx", "quick_rtf"), 
        Output = c("PDF document", "Word document", "HTML web page", "Excel spreadsheet", 
          "Powerpoint presentation", "RTF document"),
        add_colnames = TRUE
      )
font(quick_commands)[, 1] <- if (is_latex) 'cmtt' else 'Courier'

theme_plain(quick_commands)

## ---- eval = FALSE-------------------------------------------------------
#  quick_pdf(mtcars)
#  quick_pdf(mtcars, file = 'motorcars data.pdf')

