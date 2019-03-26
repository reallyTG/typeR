library(telegram.bot)


### Name: filtersLogic
### Title: Combining filters
### Aliases: filtersLogic ! !.BaseFilter &.BaseFilter |.BaseFilter

### ** Examples

not_command <- ! MessageFilters$command
text_and_reply <- MessageFilters$text & MessageFilters$reply
audio_or_video <- MessageFilters$audio | MessageFilters$video



