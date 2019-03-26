library(zeallot)


### Name: operator
### Title: Multiple assignment operators
### Aliases: operator %<-% %->%

### ** Examples

# basic usage
c(a, b) %<-% list(0, 1)

a  # 0
b  # 1

# unpack and assign nested values
c(c(e, f), c(g, h)) %<-% list(list(2, 3), list(3, 4))

e  # 2
f  # 3
g  # 4
h  # 5

# can assign more than 2 values at once
c(j, k, l) %<-% list(6, 7, 8)

# assign columns of data frame
c(erupts, wait) %<-% faithful

erupts  # 3.600 1.800 3.333 ..
wait    # 79 54 74 ..

# assign only specific columns, skip
# other columns
c(mpg, cyl, disp, ...) %<-% mtcars

mpg   # 21.0 21.0 22.8 ..
cyl   # 6 6 4 ..
disp  # 160.0 160.0 108.0 ..

# skip initial values, assign final value
TODOs <- list("make food", "pack lunch", "save world")

c(..., task) %<-% TODOs

task  # "save world"

# assign first name, skip middle initial,
# assign last name
c(first, ., last) %<-% c("Ursula", "K", "Le Guin")

first  # "Ursula"
last   # "Le Guin"

# simple model and summary
mod <- lm(hp ~ gear, data = mtcars)

# extract call and fstatistic from
# the summary
c(modcall, ..., modstat, .) %<-% summary(mod)

modcall
modstat

# unpack nested values w/ nested names
fibs <- list(1, list(2, list(3, list(5))))

c(f2, c(f3, c(f4, c(f5)))) %<-% fibs

f2  # 1
f3  # 2
f4  # 3
f5  # 5

# unpack first numeric, leave rest
c(f2, fibcdr) %<-% fibs

f2      # 1
fibcdr  # list(2, list(3, list(5)))

# swap values without using temporary variables
c(a, b) %<-% c("eh", "bee")

a  # "eh"
b  # "bee"

c(a, b) %<-% c(b, a)

a  # "bee"
b  # "eh"

# unpack `strsplit` return value
names <- c("Nathan,Maria,Matt,Polly", "Smith,Peterson,Williams,Jones")

c(firsts, lasts) %<-% strsplit(names, ",")

firsts  # c("Nathan", "Maria", ..
lasts   # c("Smith", "Peterson", ..

# handle missing values with default values
parse_time <- function(x) {
  strsplit(x, " ")[[1]]
}

c(hour, period = NA) %<-% parse_time("10:00 AM")

hour    # "10:00"
period  # "AM"

c(hour, period = NA) %<-% parse_time("15:00")

hour    # "15:00"
period  # NA

# right operator
list(1, 2, "a", "b", "c") %->% c(x, y, ...chars)

x      # 1
y      # 2
chars  # list("a", "b", "c")

# magrittr chains, install.packages("magrittr") for this example
if (requireNamespace("magrittr", quietly = TRUE)) {
  library(magrittr)

  c("hello", "world!") %>%
    paste0("\n") %>%
    lapply(toupper) %->%
    c(greeting, subject)

  greeting  # "HELLO\n"
  subject   # "WORLD!\n"
}




