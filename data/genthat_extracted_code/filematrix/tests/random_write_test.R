n = 20;

library(filematrix)
fmt = fm.create(filenamebase = tempfile(), nrow = n, ncol = n)
mat = matrix(0, nrow = n, ncol = n);


rownames(fmt) = as.character(1:nrow(fmt));
colnames(fmt) = as.character(1:ncol(fmt));

### Fully indexed access

k = 10;
for( test in 1:20 ){

    message("Fully indexed access, test ", test);
    rowset = sample.int(n, size = k);
    colset = sample.int(n, size = k);
    
    value = matrix(
                data = runif(length(rowset)*length(colset)),
                nrow = length(rowset),
                ncol = length(colset));
    
    stopifnot( all( fmt[rowset, colset] == mat[rowset, colset] ) );

    fmt[rowset, colset] = value;
    mat[rowset, colset] = value;
}
stopifnot( all( as.matrix(fmt) == mat ) );


### All columns access

k = 10;
for( test in 1:20 ){
    
    message("All columns access, test ", test);
    colset = sample.int(n, size = k);
    
    value = matrix(runif(length(rowset)*n), nrow = length(rowset), ncol = n);
    
    stopifnot( all( fmt[rowset, ] == mat[rowset, ] ) );

    fmt[rowset, ] = value;
    mat[rowset, ] = value;
}
stopifnot( all( as.matrix(fmt) == mat ) );


### All rows access

k = 10;
for( test in 1:20 ){
    
    message("All rows access, test ", test);
    colset = sample.int(n, size = k);
    
    value = matrix( runif(n*length(colset)), nrow = n, ncol = length(colset));
    
    stopifnot( all( fmt[, colset] == mat[, colset] ) );

    fmt[, colset] = value;
    mat[, colset] = value;
}
stopifnot( all( as.matrix(fmt) == mat ) );


### Vector access

k = 10;
for( test in 1:20 ){
    
    message("Vector access, test ", test);
    set = sample.int(n^2, size = k^2);
    
    value = runif(k^2);
    
    stopifnot( all( fmt[set] == mat[set] ) );
    
    fmt[set] = value;
    mat[set] = value;
}
stopifnot( all( as.matrix(fmt) == mat ) );

closeAndDeleteFiles(fmt);
