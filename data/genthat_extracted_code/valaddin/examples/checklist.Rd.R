library(valaddin)


### Name: checklist
### Title: Is a formula a check formula?
### Aliases: checklist is_check_formula is_checklist

### ** Examples

is_check_formula(list(~x, ~y) ~ is.numeric)  # [1] TRUE
is_check_formula("Not positive" ~ {. > 0})   # [1] TRUE

is_checklist(list(list(~x, ~y) ~ is.numeric, "Not positive" ~ {. > 0}))
# [1] TRUE

# Invalid checklists
is_checklist("Not positive" ~ {. > 0})            # [1] FALSE (not a list)
is_checklist(list(is.numeric ~ list(~ x)))        # [1] FALSE (backwards)
is_checklist(list(list(log ~ x) ~ is.character))  # [1] FALSE (invalid check item)




