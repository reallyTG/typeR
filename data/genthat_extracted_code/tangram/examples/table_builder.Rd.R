library(tangram)


### Name: table_builder
### Title: Table Construction Toolset
### Aliases: table_builder col_header row_header write_cell home cursor_up
###   cursor_down cursor_left cursor_right cursor_pos carriage_return
###   line_feed new_line new_row new_col table_builder_apply add_col
###   add_row

### ** Examples

library(magrittr)
table_builder()                        %>%
col_header("One","Two","Three","Four") %>%
row_header("A",   "B",   "C")          %>%
write_cell("A1")                       %>%
cursor_right()                         %>%
add_col("A2", "A3")                    %>%
home()                                 %>%
new_line()                             %>%
table_builder_apply(1:3, FUN=function(tb, x) {
  tb %>% write_cell(paste0("B",x)) %>% cursor_right()
})                                     %>%
new_col()                              %>%
add_row(paste0(c("A","B","C"), 4))     %>%
cursor_up(2)                           %>%
line_feed()                            %>%
cursor_left(3)                         %>%
add_col(paste0("C", 1:4))



