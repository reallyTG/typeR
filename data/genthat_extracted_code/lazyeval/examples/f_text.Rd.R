library(lazyeval)


### Name: f_text
### Title: Turn RHS of formula into a string/label.
### Aliases: f_text f_label

### ** Examples

f <- ~ a + b + bc
f_text(f)
f_label(f)

# Names a quoted with ``
f_label(~ x)
# Strings are encoded
f_label(~ "a\nb")
# Long expressions are collapsed
f_label(~ foo({
  1 + 2
  print(x)
}))



