library(colr)


### Name: cgrep
### Title: a function to select columns by 'regex'
### Aliases: cgrep

### ** Examples

 head(cgrep(iris, "^.+$")) # matches all columns that have non-empty column names and thus
 #drops all columns with empty names

 head(cgrep(iris, "^Petal\\.")) # matches all columns that have  names starting with the
 #string "Petal."
 head(cgrep(iris, "\\.")) # columns with names that contain a dot
 head(cgrep(iris, "\\.[Ww]idth$")) # columns with names ending in the string ".width" or ".Width".
 head(cgrep(iris, "^[SP]e.al")) # columns that have names starting with either capital
 #'S' or 'P' then an 'e' followed by any character and then 'al'




