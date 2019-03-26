library(mlrMBO)


### Name: setMBOControlTermination
### Title: Set termination options.
### Aliases: setMBOControlTermination

### ** Examples

fn = smoof::makeSphereFunction(1L)
ctrl = makeMBOControl()

# custom termination condition (stop if target function value reached)
# We neglect the optimization direction (min/max) in this example.
yTargetValueTerminator = function(y.val) {
  force(y.val)
  function(opt.state) {
    opt.path = opt.state$opt.path
    current.best = getOptPathEl(opt.path, getOptPathBestIndex((opt.path)))$y
    term = (current.best <= y.val)
    message = if (!term) NA_character_ else sprintf("Target function value %f reached.", y.val)
    return(list(term = term, message = message))
  }
}

# assign custom termination condition
ctrl = setMBOControlTermination(ctrl, more.termination.conds = list(yTargetValueTerminator(0.05)))
res = mbo(fn, control = ctrl)
print(res)



