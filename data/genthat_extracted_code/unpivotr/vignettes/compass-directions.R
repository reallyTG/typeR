## ---- echo = TRUE--------------------------------------------------------
library(dplyr)
library(tidyxl)
library(unpivotr)

## ---- echo = TRUE--------------------------------------------------------
(original <- purpose$`NNW WNW`)
tail(cells <- as_cells(original))

## ---- echo = TRUE--------------------------------------------------------
row_headers <-
  cells %>%
  dplyr::filter(col <= 2, !is.na(chr)) %>% # Select all rows of headers at once
  select(row, col, header = chr) %>%
  split(.$col) # Return each row of headers in its own element of a list
row_headers

col_headers <-
  cells %>%
  dplyr::filter(row <= 2, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$row)
col_headers

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  cells %>%
  dplyr::filter(row >= 3, col >= 3, !is.na(chr)) %>%
  mutate(value = as.integer(chr)) %>%
  select(row, col, value)
head(data_cells)

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  data_cells %>%
  enhead(col_headers[[1]], "NNW") %>%
  enhead(col_headers[[2]], "N") %>%
  enhead(row_headers[[1]], "WNW") %>%
  enhead(row_headers[[2]], "W")

## ---- echo = TRUE--------------------------------------------------------
data_cells %>% as.data.frame
NNW_WNW <- data_cells %>% arrange(row, col)

## ---- echo = TRUE--------------------------------------------------------
cells <- as_cells(purpose$`NNE WSW`)

## ---- echo = TRUE--------------------------------------------------------
row_headers <-
  cells %>%
  dplyr::filter(col <= 2, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$col)
row_headers

col_headers <-
  cells %>%
  dplyr::filter(row <= 2, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$row)
col_headers

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  cells %>%
  dplyr::filter(row >= 3, col >= 3, !is.na(chr)) %>%
  mutate(value = as.integer(chr)) %>%
  select(row, col, value)
data_cells

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  data_cells %>%
  enhead(col_headers[[1]], "NNE") %>% # Different from NNW WNW
  enhead(col_headers[[2]], "N") %>% # Same as NNW WNW
  enhead(row_headers[[1]], "WSW") %>% # Different from NNW WNW
  enhead(row_headers[[2]], "W") # Same as NNW WNW

## ---- echo = TRUE--------------------------------------------------------
data_cells %>% as.data.frame
NNE_WSW <- data_cells %>% arrange(row, col)

## ---- echo = TRUE--------------------------------------------------------
cells <- as_cells(purpose$`SSE ESE`)

## ---- echo = TRUE--------------------------------------------------------
row_headers <-
  cells %>%
  dplyr::filter(col >= 5, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$col)
row_headers

col_headers <-
  cells %>%
  dplyr::filter(row >= 21, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$row)
col_headers

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  cells %>%
  dplyr::filter(row <= 20, col <= 4, !is.na(chr)) %>%
  mutate(value = as.integer(chr)) %>%
  select(row, col, value)
data_cells

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  data_cells %>%
  enhead(col_headers[[2]], "SSE") %>%
  enhead(col_headers[[1]], "S") %>%
  enhead(row_headers[[2]], "ESE") %>%
  enhead(row_headers[[1]], "E")

## ---- echo = TRUE--------------------------------------------------------
data_cells %>% as.data.frame
SSE_ESE <- data_cells %>% arrange(row, col)

## ---- echo = TRUE--------------------------------------------------------
cells <- as_cells(purpose$`SSW ENE`)

## ---- echo = TRUE--------------------------------------------------------
row_headers <-
  cells %>%
  dplyr::filter(col >= 5, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$col)
row_headers

col_headers <-
  cells %>%
  dplyr::filter(row >= 21, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$row)
col_headers

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  cells %>%
  dplyr::filter(row <= 20, col <= 4, !is.na(chr)) %>%
  mutate(value = as.integer(chr)) %>%
  select(row, col, value)
data_cells

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  data_cells %>%
  enhead(col_headers[[2]], "SSW") %>% # Different from SSE ESE
  enhead(col_headers[[1]], "S") %>% # Same as SSE ESE
  enhead(row_headers[[2]], "ENE") %>% # Different from SSE ESE
  enhead(row_headers[[1]], "E") # Same as SSE ESE

## ---- echo = TRUE--------------------------------------------------------
data_cells %>% as.data.frame
SSW_ENE <- data_cells %>% arrange(row, col)

## ---- echo = TRUE--------------------------------------------------------
identical(NNW_WNW, NNE_WSW)
identical(SSW_ENE, SSE_ESE)
identical(NNW_WNW[, -1:-2], SSW_ENE[, -1:-2])

## ---- echo = TRUE--------------------------------------------------------
cells <- as_cells(purpose$`ABOVE LEFT`)

## ---- echo = TRUE--------------------------------------------------------
row_headers <-
  cells %>%
  dplyr::filter(col <= 2, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$col)
row_headers

col_headers <-
  cells %>%
  dplyr::filter(row <= 2, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$row)
col_headers

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  cells %>%
  dplyr::filter(row >= 3, col >= 3, !is.na(chr)) %>%
  mutate(value = as.integer(chr)) %>%
  select(row, col, value)
data_cells

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  data_cells %>%
  enhead(col_headers[[1]], "ABOVE") %>% # Different from SSE ESE
  enhead(col_headers[[2]], "N") %>% # Same as SSE ESE
  enhead(row_headers[[1]], "LEFT") %>% # Different from SSE ESE
  enhead(row_headers[[2]], "W") # Same as SSE ESE

## ---- echo = TRUE--------------------------------------------------------
data_cells %>% as.data.frame
ABOVE_LEFT <- data_cells %>% arrange(row, col)

## ---- echo = TRUE--------------------------------------------------------
cells <- as_cells(purpose$`BELOW RIGHT`)

## ---- echo = TRUE--------------------------------------------------------
row_headers <-
  cells %>%
  dplyr::filter(col >= 7, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$col)
row_headers

col_headers <-
  cells %>%
  dplyr::filter(row >= 11, !is.na(chr)) %>%
  select(row, col, header = chr) %>%
  split(.$row)
col_headers

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  cells %>%
  dplyr::filter(row <= 10, col <= 6, !is.na(chr)) %>%
  mutate(value = as.integer(chr)) %>%
  select(row, col, value)
data_cells

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  data_cells %>%
  enhead(col_headers[[2]], "BELOW") %>%
  enhead(col_headers[[1]], "S") %>%
  enhead(row_headers[[2]], "RIGHT") %>%
  enhead(row_headers[[1]], "E")

## ---- echo = TRUE--------------------------------------------------------
data_cells %>% as.data.frame
BELOW_RIGHT <- data_cells %>% arrange(row, col)

## ---- echo = TRUE--------------------------------------------------------
identical(ABOVE_LEFT[, -1:-2], BELOW_RIGHT[, -1:-2])

## ---- echo = TRUE--------------------------------------------------------
spreadsheet <- system.file("extdata/purpose.xlsx", package = "unpivotr")
cells <- tidy_xlsx(spreadsheet, "ABOVE LEFT border")$data[[1]]

## ---- echo = TRUE--------------------------------------------------------
# Same as ABOVE LEFT without borders
row_headers <-
  cells %>%
  dplyr::filter(col <= 3, !is_blank) %>%
  select(row, col, header = character) %>%
  split(.$col)
row_headers

col_headers <-
  cells %>%
  dplyr::filter(row <= 3, !is_blank) %>%
  select(row, col, header = character) %>%
  split(.$row)
col_headers

## ---- echo = TRUE--------------------------------------------------------
# Same as ABOVE LEFT without borders
data_cells <-
  cells %>%
  dplyr::filter(row >= 4, col >= 4, !is_blank) %>%
  mutate(content = ifelse(is.na(character), numeric, NA)) %>%
  mutate(value = as.integer(content)) %>%
  select(row, col, value)
data_cells

## ---- echo = TRUE--------------------------------------------------------
# Different from ABOVE LEFT without borders
# Find cells with borders on the bottom, and ones with borders on the left
formatting <- tidy_xlsx(spreadsheet)$formats
left_borders <- which(!is.na(formatting$local$border$left$style))
top_borders <- which(!is.na(formatting$local$border$top$style))

left_border_cells <-
  cells %>%
  dplyr::filter(row == 2, local_format_id %in% left_borders) %>%
  select(row, col)
top_border_cells <-
  cells %>%
  dplyr::filter(col == 2, local_format_id %in% top_borders) %>%
  select(row, col)

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  data_cells %>%
  enhead(col_headers[[1]], "ABOVE", left_border_cells) %>% # Different from ABOVE LEFT
  enhead(col_headers[[2]], "N") %>% # Same as ABOVE LEFT
  enhead(row_headers[[1]], "LEFT", top_border_cells) %>% # Different from ABOVE LEFT
  enhead(row_headers[[2]], "W") # Same as ABOVE LEFT

## ---- echo = TRUE--------------------------------------------------------
data_cells %>% as.data.frame
ABOVE_LEFT_borders <- data_cells %>% arrange(row, col)

## ---- echo = TRUE--------------------------------------------------------
cells <- tidy_xlsx(spreadsheet, "BELOW RIGHT border")$data[[1]]

## ---- echo = TRUE--------------------------------------------------------
# Same as BELOW RIGHT without borders
row_headers <-
  cells %>%
  dplyr::filter(col >= 10, !is_blank) %>%
  select(row, col, header = character) %>%
  split(.$col)
row_headers

col_headers <-
  cells %>%
  dplyr::filter(row >= 14, !is_blank) %>%
  select(row, col, header = character) %>%
  split(.$row)
col_headers

## ---- echo = TRUE--------------------------------------------------------
# Same as BELOW RIGHT without borders
data_cells <-
  cells %>%
  dplyr::filter(row <= 13, col <= 9, !is_blank) %>%
  mutate(content = ifelse(is.na(character), numeric, NA)) %>%
  mutate(value = as.integer(content)) %>%
  select(row, col, value)
data_cells

## ---- echo = TRUE--------------------------------------------------------
# Different from BELOW RIGHT without borders
# Find cells with borders on the bottom, and ones with borders on the left
formatting <- tidy_xlsx(spreadsheet)$formats
left_borders <- which(!is.na(formatting$local$border$left$style))
top_borders <- which(!is.na(formatting$local$border$top$style))

left_border_cells <-
  cells %>%
  dplyr::filter(row == 15, local_format_id %in% left_borders) %>%
  select(row, col)
top_border_cells <-
  cells %>%
  dplyr::filter(col == 11, local_format_id %in% top_borders) %>%
  select(row, col)

## ---- echo = TRUE--------------------------------------------------------
data_cells <-
  data_cells %>%
  enhead(col_headers[[2]], "BELOW", left_border_cells) %>% # Different from BELOW RIGHT
  enhead(col_headers[[1]], "S") %>% # Same as BELOW RIGHT
  enhead(row_headers[[2]], "RIGHT", top_border_cells) %>% # Different from BELOW RIGHT
  enhead(row_headers[[1]], "E") # Same as BELOW RIGHT

## ---- echo = TRUE--------------------------------------------------------
data_cells %>% as.data.frame
BELOW_RIGHT_borders <- data_cells %>% arrange(row, col)

## ---- echo = TRUE--------------------------------------------------------
identical(ABOVE_LEFT[, -1:-2], BELOW_RIGHT[, -1:-2])
identical(ABOVE_LEFT[, -1:-2], ABOVE_LEFT_borders[, -1:-2])
identical(ABOVE_LEFT[, -1:-2], BELOW_RIGHT_borders[, -1:-2])

