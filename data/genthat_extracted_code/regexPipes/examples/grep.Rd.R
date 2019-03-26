library(regexPipes)


### Name: grep
### Title: Overriding grep from base package
### Aliases: gregexpr grep grepl gsub regexec regexpr sub

### ** Examples

library(magrittr)
letters %>% regexPipes::grep("[a-z]")

txt <- c("arm","foot","lefroo", "bafoobar")
if(length(i <- txt %>% regexPipes::grep("foo")))
   cat("'foo' appears at least once in\n\t", txt, "\n")
i # 2 and 4
txt[i]

## Double all 'a' or 'b's;  "\" must be escaped, i.e., 'doubled'
gstext <- "abc and ABC"
gstext %>% regexPipes::gsub("([ab])", "\\1_\\1_")

txt <- c("The", "licenses", "for", "most", "software", "are",
  "designed", "to", "take", "away", "your", "freedom",
  "to", "share", "and", "change", "it.",
   "", "By", "contrast,", "the", "GNU", "General", "Public", "License",
   "is", "intended", "to", "guarantee", "your", "freedom", "to",
   "share", "and", "change", "free", "software", "--",
   "to", "make", "sure", "the", "software", "is",
   "free", "for", "all", "its", "users")
( i <- txt %>% regexPipes::grep("[gu]") ) # indices
stopifnot( txt[i] == txt %>% regexPipes::grep("[gu]", value = TRUE) )

## Note that in locales such as en_US this includes B as the
## collation order is aAbBcCdEe ...
(ot <- txt %>% regexPipes::sub("[b-e]", "."))
txt[ot != txt %>% regexPipes::gsub("[b-e]", ".")]#- gsub does "global" substitution

txt[txt %>% regexPipes::gsub("g", "#") !=
    txt %>% regexPipes::gsub("g", "#", ignore.case = TRUE)] # the "G" words

txt %>% regexPipes::regexpr("en")

txt %>% regexPipes::gregexpr("e")

## Using grepl() for filtering
## Find functions with argument names matching "warn":
findArgs <- function(env, pattern) {
  nms <- ls(envir = as.environment(env))
  nms <- nms[is.na(match(nms, c("F","T")))] # <-- work around "checking hack"
  aa <- sapply(nms, function(.) { o <- get(.)
               if(is.function(o)) names(formals(o)) })
  iw <- sapply(aa, function(a) any(a %>% regexPipes::grepl(pattern, ignore.case=TRUE)))
  aa[iw]
}
findArgs("package:base", "warn")

## trim trailing white space
str <- "Now is the time      "
str %>% regexPipes::sub(" +$", "")  ## spaces only
## what is considered 'white space' depends on the locale.
str %>% regexPipes::sub("[[:space:]]+$", "") ## white space, POSIX-style
## what PCRE considered white space changed in version 8.34: see ?regex
str %>% regexPipes::sub("\\s+$", "", perl = TRUE) ## PCRE-style white space

## capitalizing
txt <- "a test of capitalizing"
txt %>% regexPipes::gsub("(\\w)(\\w*)", "\\U\\1\\L\\2",  perl=TRUE)
txt %>% regexPipes::gsub("\\b(\\w)", "\\U\\1",  perl=TRUE)

txt2 <- "useRs may fly into JFK or laGuardia"
txt2 %>% regexPipes::gsub("(\\w)(\\w*)(\\w)", "\\U\\1\\E\\2\\U\\3", perl=TRUE)
txt2 %>%  regexPipes::sub("(\\w)(\\w*)(\\w)", "\\U\\1\\E\\2\\U\\3", perl=TRUE)

## named capture
notables <- c("  Ben Franklin and Jefferson Davis",
              "\tMillard Fillmore")
# name groups 'first' and 'last'
name.rex <- "(?<first>[[:upper:]][[:lower:]]+) (?<last>[[:upper:]][[:lower:]]+)"
(parsed <- notables %>% regexPipes::regexpr(name.rex, perl = TRUE))

# Example below fails, but unclear what the cause is
# notables %>% regexPipes::gregexpr(name.rex, perl = TRUE)[[2]]
# Same example with the object passed w/o magrittr does work
regexPipes::gregexpr(notables, name.rex, perl = TRUE)[[2]]
parse.one <- function(res, result) {
  m <- do.call(rbind, lapply(seq_along(res), function(i) {
    if(result[i] == -1) return("")
    st <- attr(result, "capture.start")[i, ]
    substring(res[i], st, st + attr(result, "capture.length")[i, ] - 1)
  }))
  colnames(m) <- attr(result, "capture.names")
  m
}
parse.one(notables, parsed)

## Decompose a URL into its components.
## Example by LT (http://www.cs.uiowa.edu/~luke/R/regexp.html).
x <- "http://stat.umn.edu:80/xyz"
m <- x %>% regexPipes::regexec("^(([^:]+)://)?([^:/]+)(:([0-9]+))?(/.*)")
m
regmatches(x, m)
## Element 3 is the protocol, 4 is the host, 6 is the port, and 7
## is the path.  We can use this to make a function for extracting the
## parts of a URL:
URL_parts <- function(x) {
    m <- x %>% regexPipes::regexec("^(([^:]+)://)?([^:/]+)(:([0-9]+))?(/.*)")
    parts <- do.call(rbind,
                     lapply(regmatches(x, m), `[`, c(3L, 4L, 6L, 7L)))
    colnames(parts) <- c("protocol","host","port","path")
    parts
}
URL_parts(x)

## There is no gregexec() yet, but one can emulate it by running
## regexec() on the regmatches obtained via gregexpr().  E.g.:
pattern <- "([[:alpha:]]+)([[:digit:]]+)"
s <- "Test: A1 BC23 DEF456"
lapply(regmatches(s, s %>% regexPipes::gregexpr(pattern)),
       function(e) regmatches(e, e %>% regexPipes::regexec(pattern)))




