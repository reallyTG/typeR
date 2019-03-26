make_input_arguments_object <- function(...)
{
  #print(names(match.call())[-1])
  return(list("input"=as.list(match.call()),"names"=names(match.call())[-1]))
}
