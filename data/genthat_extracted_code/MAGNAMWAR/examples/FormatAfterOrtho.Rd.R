library(MAGNAMWAR)


### Name: FormatAfterOrtho
### Title: Format file from output of OrthoMCL algorithm before use in
###   AnalyzeOrthoMCL
### Aliases: FormatAfterOrtho

### ** Examples

file <- system.file('extdata', 'orthologGroups.txt', package='MAGNAMWAR')
after_ortho_format <- FormatAfterOrtho(file)

file_grps <- system.file('extdata', 'groups_example_r.txt', package='MAGNAMWAR')
after_ortho_format_grps <- FormatAfterOrtho(file_grps, format = 'groups')




