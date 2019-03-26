library(officer)


### Name: fp_border
### Title: border properties object
### Aliases: fp_border update.fp_border

### ** Examples

fp_border()
fp_border(color="orange", style="solid", width=1)
fp_border(color="gray", style="dotted", width=1)

# modify object ------
border <- fp_border()
update(border, style="dotted", width=3)



