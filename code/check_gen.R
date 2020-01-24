
generate_outer_check_str <- function(asig, level=0) {
  
  big_cond <- ""
  
  for (i in 1:20) {
    if (level == 0) {
      big_cond <- paste(list(big_cond, generate_check_L0(asig, i)), collapse=" ")
    }
  }
  
  # return
  big_cond
  
}

generate_check_str_L0 <- function(asig) {
  
  ret_str <- "
  args <- as.list(match.call())[-1]
  "
  
  big_cond <- ""
  
  for (i in 1:20) {
    L0t <- as.character(asig[, 3 + i])
    if (is.na(L0t)) {
      break
    } else if (i != 1) {
      big_cond = paste(list(big_cond, "&&"), collapse=" ")
    }
    
    check_str <- paste(list("typeof(args[[", i, "]]) == "), collapse="")
    
    big_cond = paste(big_cond, check_str)
    
    if (L0t == "sF") {
      # function
      big_cond = paste(list(big_cond, "\"closure\"", "||", check_str, "\"builtin\"", "||", check_str, "\"special\""), collapse=" ")
    } else if (L0t == "l{?}") {
      # list
    } else {
      # catch rest
      ""
    }
  }
  
  # return
  big_cond
  
}